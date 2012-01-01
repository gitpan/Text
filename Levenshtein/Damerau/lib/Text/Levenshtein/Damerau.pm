package Text::Levenshtein::Damerau;

use strict;
use warnings;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
use List::Util qw(min);

$VERSION     = '0.01';
@ISA         = qw(Exporter);
@EXPORT      = ();
@EXPORT_OK   = qw(&edistance);
%EXPORT_TAGS = ();

sub edistance {
	my ($source,$target) = @_;

	if( _null_or_empty($source) ) {
		if( _null_or_empty($target) ) {
			return 0;
		}
		else {
			return length($target);
		}
	}
	elsif( _null_or_empty($target) ) {
		return length($source);
	}

	

	my $m = length($source);
	my $n = length($target);
	my $INF = $m + $n;
	my %H;
	$H{0}{0} = $INF;

	for(my $i = 0; $i <= $m; $i++) { $H{$i + 1}{1} = $i; $H{$i + 1}{0} = $INF; }
	for(my $j = 0; $j <= $n; $j++) { $H{1}{$j + 1} = $j; $H{0}{$j + 1} = $INF; }

	my %sd;
	for(my $key = 0; $key < ($m + $n); $key++) {
		my $letter = substr($source . $target, $key-1, 1);
		$sd{$letter} = 0;
	}
	

	for(my $i = 1; $i <= $m; $i++) {
		my $DB = 0;

		for(my $j = 1; $j <= $n; $j++) {
			my $i1 = $sd{substr($target, $j-1, 1)};
			my $j1 = $DB;

			if( substr($source, $i-1, 1) eq substr($target, $j-1, 1) ) {
				$H{$i + 1}{$j + 1} = $H{$i}{$j};
				$DB = $j;
			}
			else {
				$H{$i + 1}{$j + 1} = min($H{$i}{$j}, min($H{$i + 1}{$j}, $H{$i}{$j + 1})) + 1;
			}

			$H{$i + 1}{$j + 1} = min($H{$i + 1}{$j + 1}, $H{$i1}{$j1} + ($i - $i1 - 1) + 1 + ($j - $j1 - 1));
		}

		$sd{substr($source, $i-1, 1)} = $i;
	}

	return $H{$m + 1}{$n + 1};
}



sub _null_or_empty {
	my $s = shift;
	
	if( defined($s) && $s ne '') {
		return 0;
	}
	
	return 1;
}

1;

__END__

=head1 NAME

Text::Levenshtein::Damerau - Damerau Levenshtein edit distance

=head1 SYNOPSIS

 use Text::Levenshtein::Damerau qw(edistance);

 print edistance("foo","four");
 # prints "2"
 

 print edistance("svee","seven");
 # prints "2"

 print edistance("ABC","abC");
 # prints "2"

=head1 DESCRIPTION

Returns the true Damerau Levenshtein edit distance of strings.

=head1 AUTHOR

Copyright 2011 Nick Logan <F<nickl@skunkds.com>>

This package is free software and is provided "as is" without express
or implied warranty.  You can redistribute it and/or modify it under 
the same terms as Perl itself.

=cut