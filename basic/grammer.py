import os
import sys
import re

def ifGrammar():
    flag = 1
    if flag == 2:
        print "flag == 2"
    elif flag == 3:
        print "flag == 3"
    else:   
        print "else gramar"

def whileGrammar():
    i = 0   

    print "while" 
    while i < 10: 
        print i 
        i += 1  
    print "end while"

def forGrammar():
    print "for"
    for i in range(10):
        print i 
    print "end for"

def arrayGrammar():
    print "array Grammar"
    a = [1, 2, 3, 4, 5]
    for i in range(len(a)):
        print i, a[i] 
    print "end for one"
    for elt in a:
        print elt
    print "end for two"

def mapGrammar():
    print "map Grammar".
    print "map Grammar"
    m = { }
    i = 0
    while i < 3:
        for j in range(10):
            m[j] = j
        i += 1

    for e in m:
        print e, m[e]
    print "end map"

def fileGrammar():
    print "read file"
    handler = open("grammar.py")
    for line in handler:
        print line
    print "end file"

def regexGrammar():
    print "regex grammar"
    s = "this grammar is my regex"
    p = re.compile(r'th(.*m).*(g.*)')
    obj = p.match(s)
    print "all group", obj.group()
    print "group(1)", obj.group(1)
    print "group(2)", obj.group(2)
    #for e in obj.groups():
    #   print e, len(e)
    print "end regex"

def function(name):
    print "Hello %s ! This is first python function" % name

if __name__ == "__main__":
    function("susu")
    ifGrammar()
    whileGrammar()
    forGrammar()
    arrayGrammar()
    mapGrammar()
    #fileGrammar()
    regexGrammar()
