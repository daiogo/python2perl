#!/usr/bin/perl

#COMP2041 Assignment I
#Based on http://www.cse.unsw.edu.au/~cs2041/assignments/python2perl
#Written by Diogo G. Garcia de Freitas (dggf.93@gmail.com) September 2014


sub translateLine #Contains whole translation algorithm
{
	my $line = $_[0]; #Variable $line gets the attribute passed as parameter
	
	if ($line =~ /^#!/ && $. == 1)
	{
		#Includes the #! line

		print "#!/usr/bin/perl -w\n";
	}
	elsif ($line =~ /^\s*#/ || $line =~ /^\s*$/)
	{
		#Blank and comment lines can be passed unchanged

		print "$line";
	}
	elsif ($line =~ /^\s*print\s*"(.*)"\s*$/)
	{
		#Python's print print a new-line character by default, so we need to add it explicitly to the Perl print statement		

		print "print \"$1\\n\";\n";
	}
	elsif ($line =~ /^['"].*['"]/) #If not a string 
	{
		#Translates variable names

		@temp = $line =~ m/[a-zA-Z0-9]+/g;
		push(@variables, @temp);

		foreach $variable (@variables)
		{
			#print "\$$variable";
		}
	}
	else
	{
		#Lines we can't translate are turned into comments
		print "#$line\n";
	}
}


if ($#ARGV + 1 == 0) #Read from stdin 	
{
	while ($l = <>)
	{
		#translateLine($l);
	}	
}
elsif ($#ARGV + 1 == 1) #Open and read from file
{
	open(F,"<$ARGV[0]") or die "$0: Can't open $ARGV[0]: $!\n";
	
	while(<F>)
	{	
		#print "$_\n"; #debugging
		translateLine($_);
	}

	close(F);
}
