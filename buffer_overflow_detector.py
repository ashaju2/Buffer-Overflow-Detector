# Complie Instructions: 
#  python buffer_overflow_detector.py [Assembly file name]
#   eg:   
#       python buffer_overflow_detector.py [sample_bufferoverflow_code_assembly2.asm]

import re
import sys

words = []
searchfile = open(sys.argv[1], "r")
for line in searchfile:
    if "eax, DWORD PTR" in line:
         print line
         words = re.findall(r'\d+', line)
         #words = line.split()
         print words
for value in words:
    if (int(value) > 20):
        print "Higher chance of buffer overflow"
    else:
        print "Lower chance of buffer overflow"  
searchfile.close()
