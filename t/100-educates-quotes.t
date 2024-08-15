#!/usr/bin/env perl -w

use strict;

use Test::More;

# use IPC::Open2;
use File::Temp;

use Bin qw($BIN);

my $input = q{
It was all very well to say 'Drink me,' but the wise little Alice was
not going to do THAT in a hurry. 'No, I’ll look first,' she said, 'and
see whether it's marked "poison" or not'; for she had read several nice
little histories about children who had got burnt, and eaten up by wild
beasts and other unpleasant things, all because they WOULD not remember
the simple rules their friends had taught them: such as, that a red-hot
poker will burn you if you hold it too long; and that if you cut your
finger VERY deeply with a knife, it usually bleeds; and she had never
forgotten that, if you drink much from a bottle marked 'poison,' it is
almost certain to disagree with you, sooner or later.
};

# my $actual = system("$BIN < $input");
# open(my $stdin, '|-', $BIN);
# print $stdin $input;
# close($stdin);
# my $actual = do {
# my $pid = open2(my $out, my $in, $BIN);
# print $in $input;
# my $actual = <$out>;
# close($out);
# close($in);
#
# waitpid($pid, 0);
# };
# my $pid = open2(\*OUT, \*IN, $BIN);
# my $out;
# my $in;
# my $pid = open2($out, $in, $BIN);
# print $in $input;
# my $actual = <$out>;
# print IN $input;
# close(IN);
# my $actual = <OUT>;
# while (<OUT>) {
# 	print STDERR $_;
# }
# waitpid($pid, 0);

my ($input_file, $input_filename) = File::Temp::tempfile();
print $input_file $input;
close($input_file);
my $actual = qx($BIN < $input_filename);

my $expected = q{
It was all very well to say ‘Drink me,’ but the wise little Alice was
not going to do THAT in a hurry. ‘No, I’ll look first,’ she said, ‘and
see whether it’s marked “poison” or not’; for she had read several nice
little histories about children who had got burnt, and eaten up by wild
beasts and other unpleasant things, all because they WOULD not remember
the simple rules their friends had taught them: such as, that a red-hot
poker will burn you if you hold it too long; and that if you cut your
finger VERY deeply with a knife, it usually bleeds; and she had never
forgotten that, if you drink much from a bottle marked ‘poison,’ it is
almost certain to disagree with you, sooner or later.
};

is $actual, $expected;


done_testing;
