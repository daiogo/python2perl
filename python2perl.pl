#!/usr/bin/perl

#COMP2041 Assignment I
#Based on http://www.cse.unsw.edu.au/~cs2041/assignments/python2perl
#Written by Diogo G. Garcia de Freitas (dggf.93@gmail.com) September 2014



while ($line = <>) {
	if ($line =~ /^#!/ && $. == 1) {
	
		# translate #! line 
		
		print "#!/usr/bin/perl -w\n";
	} elsif ($line =~ /^\s*#/ || $line =~ /^\s*$/) {
	
		# Blank & comment lines can be passed unchanged
		
		print $line;
	} elsif ($line =~ /^\s*print\s*"(.*)"\s*$/) {
	
		# Python's print print a new-line character by default
		# so we need to add it explicitly to the Perl print statement
		
		print "print \"$1\\n\";\n";
	} else {
	
		# Lines we can't translate are turned into comments
		
		print "#$line\n";
	}
}
