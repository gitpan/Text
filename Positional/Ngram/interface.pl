#!/usr/local/bin/perl
########################################################################
# PROGRAM: interface.pl
#
# Copyright (C), 2003
# Bridget McInnes,      thomson@d.umn.edu
# University of Minnesota, Duluth
#
# USAGE:
#          %perl interface.pl FILE
#
#######################################################################

use Ngram;

if($#ARGV == -1) { print "Please specify filename."; } 

#  Create the accessor
$test = Text::Positional::Ngram->new();

#  Set the ngram file name
$test->set_ngram_file("hamlet.ngram");

#  Create the files
$test->create_files($ARGV[0]);

#  Set the marginals
$test->set_marginals(1);

#  Set the ngram size
$test->set_ngram_size(2);

#  Set the window size
$test->set_window_size(3);

#  get the ngrams
$test->get_ngrams();

#  remove the miscellaneous file created
$test->remove_files();
