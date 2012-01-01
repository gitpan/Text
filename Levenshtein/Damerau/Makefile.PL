

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Text::Levenshtein::Damerau',
    VERSION_FROM => 'lib/Text/Levenshtein/Damerau.pm', # finds \$VERSION
    AUTHOR       => 'Nick Logan (nickl@skunkds.com)',
    ABSTRACT     => '',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
                    },
);
