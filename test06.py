#!/usr/bin/python

#echon program in python
#Written by: Diogo Garcia de Freitas

import sys

if not sys.argv[1].isdigit():
	print("Usage: ./echon.py");
elif len(sys.argv) != 3:
	print("Usage: ./echon.py");
else:
	for i in range(0, int(sys.argv[1])):
		print(sys.argv[2]);
