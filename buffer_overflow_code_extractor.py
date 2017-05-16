#Python 3

from urllib.request import urlopen
import sys
import subprocess
import re

fhand = urlopen('https://github.com/sop/cygextreg/commit/683debcb884e0c01789f339bf643c23cb9ac85bb#diff-d1122a5c225e54f1311b28191b55a7f3')

for line in fhand:
    code = re.search('.+', str(line))
    print(code.group(0))
    print(code.group(0), file=open("output.txt", "a"))

