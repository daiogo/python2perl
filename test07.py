#!/usr/bin/python

#digits program in python
#Written by: Diogo Garcia de Freitas

import sys
import re
re.compile('<title>(.*)</title>')

counter = 0;
array = [];

for line in sys.stdin: #Needs to pres ctrl+D twice
	counter += 1;
	array.append(line);

for i in range(0, counter):
	output = re.sub('\n', '', array[i]);
	output = re.sub('[0-4]', '<', output);
	output = re.sub('[6-9]', '>', output);
	print(output);


