#!/usr/bin/python

#tail program in python
#Written by: Diogo Garcia de Freitas

import sys
import re

for i in range(1, len(sys.argv)):
	f = open(sys.argv[i], "r");
	counter = 0;	
	array = [];
	for line in f:
		counter += 1;
		line = re.sub('\n', '', line);
		array.append(line);
	f.close();
	if counter < 10:
		limit = 0;
	else:
		limit = counter - 10;
	for i in range(limit, counter):
		print(array[i]);
