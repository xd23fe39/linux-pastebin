#!/usr/bin/python3
## -*- coding: utf-8 -*-

import random

##########################################################################
# Application Data Structure (Dialog Application)

AppData = {
    "ID": "201912240050",
    "TYPE": "DIALOG",
    "NAME": "DIALOG Application (Sample)",
    "ASK": "Wie heißt Deine Lieblingsfarbe?",
    "CHOOSE": ["rot", "grün", "blau", "gelb"],
    "IFOK": ["Sehr schöne Farbe.", "Warum gerade die!?.", "Danke!", "Super!"],
    "OTHERWISE": ["Kenne ich nicht.", "Soll das eine Farbe sein?", "Was heißt das?", "Habe ich nicht verstanden."]
}

##########################################################################
# Application Class (Dialog Application)

class Application:

    def __init__(self, data):
        self.data = data

    def main(self):
        # Startbildschirm anzeigen
        print("ID: {:s}".format(self.data["ID"]))
        print("NAME: {:s}".format(self.data["NAME"]))
        print("")
        # Eingabe anfordern
        intend = input(self.data["ASK"] + " ")
        # Antworten 
        for value in self.data["CHOOSE"]:
            if (value == intend):
                say = self.data["IFOK"][random.randint(0,3)]
                break
            else:
                say = self.data["OTHERWISE"][random.randint(0,3)]
        print("\n{:s}\n".format(say))
        return 0

##########################################################################
# MAIN Procedure

if __name__ == "__main__":
    App = Application(AppData)
    App.main()
