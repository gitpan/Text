# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 22;
BEGIN { use_ok('Text::Positional::Ngram') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

use Text::Positional::Ngram;

##################################################################
# Sub Test 1: check token using an eclectic collection of token  #
# definitions ;)                                                 #
##################################################################

############################
# Subtest 1a: using /\w+/  #
############################

$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
    exit; 
}

# input token definition file
$TOKENFILE = "t/TESTING/test-1.sub-1-a.token.txt";

# check if this file exists. if not, quit!  
if (!(-e $TOKENFILE)) {
    print "File $TOKENFILE does not exist... aborting\n";
    exit;
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-1-a.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test! 
$test1a = Text::Positional::Ngram->new();
ok( defined($test1a), 'test1-a new() works'); # Test2

$test1a->set_token_file($TOKENFILE);
$test1a->create_files($TESTFILE);
$test1a->set_marginals();
$test1a->get_ngrams();
$test1a->remove_files();

#  Get the ngram file
$DESTFILE = $test1a->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences",  'Test 1-a OK'); #Test3

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

################################
# Subtest 1b: using /[.,;:']/  #
################################

# input file 
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n"; 
    exit; 
}

# input token definition file
$TOKENFILE = "t/TESTING/test-1.sub-1-b.token.txt";

if (!(-e $TOKENFILE)) {
    print "File $TOKENFILE does not exist... aborting\n";
    exit;
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-1-b.reqd";   

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test1b = Text::Positional::Ngram->new();
$test1b->set_token_file($TOKENFILE);
$test1b->create_files($TESTFILE);
$test1b->set_marginals();
$test1b->get_ngrams();
$test1b->remove_files();

#  Get the ngram file
$DESTFILE = $test1b->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 1-b OK'); # Test 4
  
system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

########################################
# Subtest 1c: using following regexs:  #
#                                      #
#   /th/                               #
#   /nd/                               #
#   /\w+/                              #
########################################

# input file 
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n"; 
    exit; 
}

# input token definition file
$TOKENFILE = "t/TESTING/test-1.sub-1-c.token.txt";

if (!(-e $TOKENFILE)) {
    print "File $TOKENFILE does not exist... aborting\n";
    exit;
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-1-c.reqd";   

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test1c = Text::Positional::Ngram->new();
$test1c->set_token_file($TOKENFILE);
$test1c->create_files($TESTFILE);
$test1c->set_marginals();
$test1c->get_ngrams();
$test1c->remove_files();

#  Get the ngram file
$DESTFILE = $test1c->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 1-c OK'); # Test 5

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

#############################################
# Subtest 1d: using following regex: /.../  #
#############################################

# input file 
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n"; 
    exit; 
}

# input token definition file
$TOKENFILE = "t/TESTING/test-1.sub-1-d.token.txt";

if (!(-e $TOKENFILE)) {
    print "File $TOKENFILE does not exist... aborting\n";
    exit;
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-1-d.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test1d = Text::Positional::Ngram->new();
$test1d->set_token_file($TOKENFILE);
$test1d->create_files($TESTFILE);
$test1d->set_marginals();
$test1d->get_ngrams();
$test1d->remove_files();

#  Get the ngram file
$DESTFILE = $test1d->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 1-d OK'); # Test 6

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

#############################################
# Subtest 1e: using following regex: /.../  #
#############################################

# input file 
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
    exit;
}

# input token definition file
$TOKENFILE = "t/TESTING/test-1.sub-1-e.token.txt";

if (!(-e $TOKENFILE)) {
    print "File $TOKENFILE does not exist... aborting\n";
    exit;
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-1-e.reqd";   

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test1e = Text::Positional::Ngram->new();
$test1e->set_token_file($TOKENFILE);
$test1e->create_files($TESTFILE);
$test1e->set_marginals();
$test1e->get_ngrams();
$test1e->remove_files();

#  Get the ngram file
$DESTFILE = $test1e->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 1-e OK'); # Test 7

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

#############################################
# Subtest 1f: using following regex: /.../  #
#############################################

# input file 
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
    exit; 
}

# input token definition file
$TOKENFILE = "t/TESTING/test-1.sub-1-f.token.txt";

if (!(-e $TOKENFILE)) {
    print "File $TOKENFILE does not exist... aborting\n";
	exit;
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-1-f.reqd";   

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test1f = Text::Positional::Ngram->new();
$test1f->set_token_file($TOKENFILE);
$test1f->create_files($TESTFILE);
$test1f->set_marginals();
$test1f->get_ngrams();
$test1f->remove_files();

#  Get the ngram file
$DESTFILE = $test1f->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 1-f OK');  # Test 8

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

######################################
#  Sub Test 2 : Checking ngram size  #
######################################

##################################
#  Subtest 2a: testing unigrams  #
##################################

# input file 
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
    exit; 
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-2-a.reqd";   

# check if this file exists. if not, quit!  
if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit; 
}

# now the test!
$test2a = Text::Positional::Ngram->new();
$test2a->create_files($TESTFILE);
$test2a->set_ngram_size(1);
$test2a->get_ngrams();
$test2a->remove_files();

#  Get the ngram file
$DESTFILE = $test2a->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 2-a OK');  # Test 9

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

##################################
#  Subtest 2b: testing trigrams  #
##################################

# input file 
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
    exit; 
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-2-b.reqd";   

# check if this file exists. if not, quit!  
if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit; 
}

# now the test!
$test2b = Text::Positional::Ngram->new();
$test2b->create_files($TESTFILE);
$test2b->set_ngram_size(3);
$test2b->set_marginals();
$test2b->get_ngrams();
$test2b->remove_files();

#  Get the ngram file
$DESTFILE = $test2b->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 2-b OK'); # Test 10

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

#################################
#  Subtest 2c: testing 4-grams  #
#################################

# input file 
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
    exit; 
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-2-c.reqd";   

# check if this file exists. if not, quit!  
if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit; 
}

# now the test!
$test2c = Text::Positional::Ngram->new();
$test2c->create_files($TESTFILE);
$test2c->set_ngram_size(4);
$test2c->set_marginals();
$test2c->get_ngrams();
$test2c->remove_files();

#  Get the ngram file
$DESTFILE = $test2c->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 2-c OK'); # Test 11

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

################################
#  Subtest 3: check stop list  #
################################

###########################################
#  Subtest 3a: checking create_stop_list  #
###########################################

# input file 
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n"; 
    exit; 
}

# stop file
$STOPFILE = "t/TESTING/test-1.sub-3.stop.txt";

if (!(-e $STOPFILE)) {
    print "File $STOPFILE does not exist... aborting\n";
    exit;
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-3-a.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test3a = Text::Positional::Ngram->new();
$test3a->create_stop_list($STOPFILE);
$test3a->create_files($TESTFILE);
$test3a->set_ngram_size(2);
$test3a->set_marginals();
$test3a->get_ngrams();
$test3a->remove_files();

#  Get the ngram file
$DESTFILE = $test3a->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 3a OK'); # Test 12

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");


########################################################
#  Subtest 3b: using create_stop_list in default mode  #
########################################################

# input file
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
    exit;
}

# stop file
$STOPFILE = "t/TESTING/test-1.sub-3-b.stop.txt";

if (!(-e $STOPFILE)) {
    print "File $STOPFILE does not exist... aborting\n";
	exit;
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-3-b.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test3b = Text::Positional::Ngram->new();
$test3b->create_stop_list($STOPFILE);
$test3b->create_files($TESTFILE);
$test3b->set_ngram_size(2);
$test3b->set_marginals();
$test3b->get_ngrams();
$test3b->remove_files();

#  Get the ngram file
$DESTFILE = $test3b->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 3b OK'); # Test 13

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

####################################################
# Subtest 3c: using create_stop_list() in OR mode  #
####################################################

# input file
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
    exit;
}

# stop file
$STOPFILE = "t/TESTING/test-1.sub-3-c.stop.txt";

if (!(-e $STOPFILE)) {
    print "File $STOPFILE does not exist... aborting\n";
    exit;
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-3-c.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test3c = Text::Positional::Ngram->new();
$test3c->create_stop_list($STOPFILE);
$test3c->create_files($TESTFILE);
$test3c->set_stop_mode("OR");
$test3c->set_ngram_size(2);
$test3c->set_marginals();
$test3c->get_ngrams();
$test3c->remove_files();

#  Get the ngram file
$DESTFILE = $test3c->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences",  'Test 3c OK'); # Test 14

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

#########################################################
#  Subtest 4: check set_frequency and remove functions  #
#########################################################

########################################
#  Subtest 4a: using set_frequency(2)  #
########################################

# input file 
$TESTFILE = "t/TESTING/test-1.sub-4.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n"; 
    exit; 
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-4-a.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test4a = Text::Positional::Ngram->new();
$test4a->create_files($TESTFILE);
$test4a->set_frequency(2);
$test4a->set_ngram_size(2);
$test4a->set_marginals();
$test4a->get_ngrams();
$test4a->remove_files();

#Get the ngram file
$DESTFILE = $test4a->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 4a OK'); # Test 15

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

########################################
#  Subtest 4b: using set_frequency(4)  #
########################################

# input file 
$TESTFILE = "t/TESTING/test-1.sub-4.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n"; 
    exit; 
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-4-b.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test4b = Text::Positional::Ngram->new();
$test4b->create_files($TESTFILE);
$test4b->set_frequency(4);
$test4b->set_ngram_size(2);
$test4b->set_marginals();
$test4b->get_ngrams();
$test4b->remove_files();

#  Get the ngram file
$DESTFILE = $test4b->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 4b OK'); # Test 16 

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

#####################################
#  Subtest 4c: using set_remove(2)  #
#####################################

# input file 
$TESTFILE = "t/TESTING/test-1.sub-4.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n"; 
    exit; 
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-4-c.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
	exit;
}

# now the test!
$test4c = Text::Positional::Ngram->new();
$test4c->create_files($TESTFILE);
$test4c->set_remove(2);
$test4c->set_marginals();
$test4c->get_ngrams();
$test4c->remove_files();

#  Get the ngram file
$DESTFILE = $test4c->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 4c OK'); # Test 17

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");


#####################################
#  Subtest 4d: using set_remove(4)  #
#####################################

# input file 
$TESTFILE = "t/TESTING/test-1.sub-4.txt";

# check if this file exists. if not, quit!  
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n"; 
    exit; 
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-4-d.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test4d = Text::Positional::Ngram->new();
$test4d->create_files($TESTFILE);
$test4d->set_remove(4);
$test4d->set_ngram_size(2);
$test4d->set_marginals();
$test4d->get_ngrams();
$test4d->remove_files();

#  Get the ngram file
$DESTFILE = $test4d->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 4d OK'); # Test 18

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

##########################################
#  Subtest 5 : Check set_nontoken(FILE)  #
##########################################

#####################################################################
#  Subtest  5a: using single nontoken regex /(o|O)(n|N)/ to remove  #
#  every occurrence of on,On,ON,oN from the input stream            # 
#####################################################################

# input file
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
    exit;
}

#  nontoken file
$NONTOKENFILE = "t/TESTING/test-1.sub-5-a.nontoken.txt";

# check if this file exists. if not, quit!
if (!(-e $NONTOKENFILE)) {
    print "File $NONTOKENFILE does not exist... aborting\n";
    exit;
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-5-a.reqd";

#  check if this file exists, if not, quit.
if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
$test5a = Text::Positional::Ngram->new();
$test5a->set_nontoken_file($NONTOKENFILE);
$test5a->create_files($TESTFILE);
$test5a->set_marginals();
$test5a->get_ngrams();
$test5a->remove_files();

#  Get the ngram file
$DESTFILE = $test5a->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 5a OK'); # Test 19

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

#################################################
#  Subtest 5b: using following nontoken regexs  #
#  /i./                                         #
#  /.e/                                         #
#  /[A-Z]/                                      #
#  To remove every occurrence of                #
#  'i' and its following character              #     
#  'e' and its preceding character              # 
#  and any uppercase letter                     #
#################################################  

# input file
$TESTFILE = "t/TESTING/test-1.txt";

# check if this file exists. if not, quit!
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
	exit;
}

#  nontoken file
$NONTOKENFILE = "t/TESTING/test-1.sub-5-b.nontoken.txt";

# check if this file exists. if not, quit!
if (!(-e $NONTOKENFILE)) {
    print "File $NONTOKENFILE does not exist... aborting\n";
	exit;
}

# required output file
$TARGETFILE = "t/TESTING/test-1.sub-5-b.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
	exit;
}

# now the test!
$test5b = Text::Positional::Ngram->new();
$test5b->set_nontoken_file($NONTOKENFILE);
$test5b->create_files($TESTFILE);
$test5b->set_marginals();
$test5b->get_ngrams();
$test5b->remove_files();

#  Get the ngram file
$DESTFILE = $test5b->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences", 'Test 5b OK'); # Test 20

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");

###############################
# Subtest 6 : Check windowing #
###############################
print "Subtest 6: Checking windowing option \n\n";

# Subtest  6a: using ngram size = 3 and window size = 4

# input file
$TESTFILE = "TESTING/test-1.txt";

# check if this file exists. if not, quit!
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
    exit;
}

# required output file
$TARGETFILE = "TESTING/test-1.sub-6-a.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
print "Subtest 6-a : ngram size = 3 and window size = 4\n";
$test6a = Text::Positional::Ngram->new();
$test6a->set_window_size(4);
$test6a->set_ngram_size(3);
$test6a->create_files($TESTFILE);
$test6a->get_ngrams();
$test6a->remove_files();

#  Get the ngram file
$DESTFILE = $test6a->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences");

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");


#########################################################
# Subtest  6b: using ngram size = 2 and window size = 4 #
#########################################################

# input file
$TESTFILE = "TESTING/test-1.txt";

# check if this file exists. if not, quit!
if (!(-e $TESTFILE)) {
    print "File $TESTFILE does not exist... aborting\n";
    exit;
}

# required output file
$TARGETFILE = "TESTING/test-1.sub-6-b.reqd";

if (!(-e $TARGETFILE)) {
    print "File $TARGETFILE does not exist... aborting\n";
    exit;
}

# now the test!
print "Subtest 6-b : ngram size = 2 and window size = 4\n";
$test6b = Text::Positional::Ngram->new();
$test6b->set_window_size(4);
$test6b->set_ngram_size(2);
$test6b->create_files($TESTFILE);
$test6b->get_ngrams();
$test6b->remove_files();

#  Get the ngram file
$DESTFILE = $test6b->get_ngram_file();

#compare the actual output with the required output
system("sort $DESTFILE > one");
system("sort $TARGETFILE > two");
system("diff one two > differences");

ok( -z "differences");

system("/bin/rm -f one two differences"); 
system("/bin/rm -f $DESTFILE");



