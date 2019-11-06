import re
import csv
from collections import defaultdict
from csv import DictReader

###########################################################
## TEST

def print_sammler(filename):
    with open(filename) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            print(row['errolename'], row['erglobalid'],"\n")    

def print_people(filename):
    with open(filename) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            print(row['uid'], row['cn'])    

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
            ret[row['erglobalid']] = { 'NAME' : row['errolename'] }    
    return ret

def print_roles(person, rolecache):
    roles = person['ROLES']
    ra = roles.split('|')
    for i in ra:
        # print (i[11:38])
        res = re.search("^erglobalid=(.*),(.*)$",i[:38])
        roleId = res.group(1)
        while True:
            try:
                sammler = rolecache[roleId]
                print(" RoleID: ", roleId, " - ", sammler['NAME'])
                break
            except:
                break
        
def print_all(personcache, rolecache):
    ret = {}
    for person in personcache.items():
        print(personcache[person[0]]['UID'], " - ", personcache[person[0]]['NAME'])
        roles = personcache[person[0]]['ROLES']
        ra = roles.split('|')
        for i in ra:
            # print (i[11:38])
            res = re.search("^erglobalid=(.*),(.*)$",i[:38])
            roleId = res.group(1)
            while True:
                try:
                    sammler = rolecache[roleId]
                    print(" RoleID: ", roleId, " - ", sammler['NAME'])
                    ret[roleId] = { 'ROLEID' : roleId , 'NAME' : sammler['NAME'] }
                    break
                except:
                    break
    return ret
        

###########################################################
## TEST

def parse_csv(filename, fieldnames=None, delimiter=','):
    result = defaultdict(list)
    with open(filename) as infile:
        reader = DictReader(
            infile, fieldnames=fieldnames, delimiter=delimiter
        )
        for row in reader:
            for fieldname, value in row.items():
                result[fieldname].append(value)
    return result

###########################################################
## MAIN

roles = read_roles("in1.TXT")
peoples = read_people("in2.TXT")

# print(peoples['suchtext'])
# print(peoples['suchtext']['NAME'])
# print_sammler("in2.TXT")

# print(peoples['suchtext'])
ret = print_all(peoples, roles)

for i in ret:
    print(ret[i]['ROLEID'], ";",ret[i]['NAME'])
# for p in peoples.items():
#    print(p)
