# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'Text::Levenshtein::Damerau' ); }

my $object = Text::Levenshtein::Damerau->new ();
isa_ok ($object, 'Text::Levenshtein::Damerau');


