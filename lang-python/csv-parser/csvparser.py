# Python Script: csvparser.py
# Written 2019 by xd23fe39

import re       # Regular Expressions
import csv      # CSV DictReader
# import collections 

# Filenames
PEOPLE_FILE="people.csv"
ROLES_FILE="roles.csv"

# Read and work in Memory cache
CACHE_PEOPLE = {}
CACHE_ROLES = {}

###########################################################
## Output CSV Files

def print_roles(filename):
    with open(filename) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            print(row['id'], "|", row['name'], row['description'])    

def print_people(filename):
    with open(filename) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            print(row['uid'], ":", row['cn'])    

###########################################################
## Load CSV file in memory

def read_people(filename):
    ret = {}
    with open(filename) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            ret[row['uid']] = { 'UID' : row['uid'] , 'NAME' : row['cn'] , 'ROLES' : row['erroles'] } 
    return ret

def read_roles(filename):
    ret = {}
    with open(filename) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            ret[row['id']] = { 'ID' : row['id'], 'NAME' : row['name'], 'DESC' : row['description'] }    
    return ret

###########################################################
## Working with CSV Data in memory

def print_role_membership(person, role_cache):
    roles = person['ROLES']
    ra = roles.split('|')
    for i in ra:
        # print (i[11:38])
        res = re.search("^id=(.*),ou=roles(.*)",i)
        roleId = res.group(1)
        while True:
            try:
                role = role_cache[roleId]
                print("Member in:", role['NAME'], "|", roleId)
                break
            except:
                break
    return 0

def print_all(personcache, rolecache):
    for key,person in personcache.items():
        print("Person:", person['NAME'], "|", person['UID'])
        print_role_membership(person, rolecache)
        print("---")
    return 0

###########################################################
## Write to file

def print_to_file(filename, str):
    fh = open(filename, "a+")
    fh.write(str + "\n")
    fh.close()

def print_cache_to_file(filename, cache):
    fh = open(filename, "w")
    for key, item in cache.items():
        fh.write(key)
        for name, value in item.items():
            fh.write(";" + name + "=" + value)
        fh.write("\n")
    fh.close()

###########################################################
## MAIN

print("CSVPARSER Sample Script, Version 19.11.001")

print("\nSTEP 01: print_people()")
print_people(PEOPLE_FILE)

print ("\nSTEP 02: print_roles()")
print_roles(ROLES_FILE)

print ("\nSTEP 03: Load-in-memory")
CACHE_ROLES = read_roles(ROLES_FILE)
CACHE_PEOPLE = read_people(PEOPLE_FILE)
print ("OK")

print ("\nSTEP 04: Role membership")
print_role_membership(CACHE_PEOPLE['frank'], CACHE_ROLES)

print ("\nSTEP 05: Role membership for all people")
print_all(CACHE_PEOPLE, CACHE_ROLES)

print ("\nSTEP 06: Write to file demo")
print_cache_to_file("output.txt", CACHE_PEOPLE)

print ("\nEND: OK")

