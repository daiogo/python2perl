#!/usr/bin/perl

#COMP2041 Assignment I
#Based on http://www.cse.unsw.edu.au/~cs2041/assignments/python2perl
#Written by Diogo G. Garcia de Freitas (dggf.93@gmail.com) September 2014

sub translateLine #Contains translation algorithm
{
	my $line = $_[0]; #Variable $line gets the variable passed as parameter

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
	elsif ($line =~ /\s*print\s*[("']*.*[)"']*/)
	{
		#Translates print

		$line =~ s/\s*print\s*//g;
		$line =~ s/[;\n]//g;
		$line =~ s/\"\s*\+\s*\"//g; #Performs string concatenation in print statements		

		if ($line =~ s/[\+\s]+str\s*\(/\$/g)
		{
			$line =~ s/\)[\s*\+\s*]*//g;
			$line =~ s/["']//g;
			print "print \"$line\\n\";\n";
		}
		elsif ($line =~ m/['"].*["']/g)
		{
			$line =~ s/["']//g;
			print "print \"$line\\n\";\n";
			#do nothing
		}
		else
		{
			#print "LOL!\n";
			$line =~ s/([a-zA-Z]+[0-9]*)/\$$1/g;
			print "print $line;\n";
			print "print \"\\n\";\n";
		}

	}
	elsif ($line =~ /\w+\s*=\s*\w+/)
	{
		#Translates variables

		$line =~ s/;//g;
		$line =~ s/\n//g;
		$line =~ s/([a-zA-Z]+[0-9]*)/\$$1/g;
		print "$line;\n";
	}
	elsif ($line =~ /^\s*break;*$/)
	{
		#Translates break to last

		$line =~ s/;//;
		$line =~ s/\n//g;
		$line =~ s/break/last/;
		print "$line;\n";
	}
	elsif ($line =~ /^\s*continue;*$/)
	{
		#Translates continue to next

		$line =~ s/;//;
		$line =~ s/\n//g;
		$line =~ s/continue/next/;
		print "$line;\n";
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
		translateLine($l);
	}
}
elsif ($#ARGV + 1 == 1) #Open and read from file
{
	open(F,"<$ARGV[0]") or die "$0: Can't open $ARGV[0]: $!\n";

	while(<F>)
	{
		translateLine($_);
	}

	close(F);
}
