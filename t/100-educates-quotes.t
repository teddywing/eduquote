#!/usr/bin/env perl -w

# Copyright (c) 2024  Teddy Wing
#
# This file is part of Eduquote.
#
# Eduquote is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Eduquote is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Eduquote. If not, see <https://www.gnu.org/licenses/>.


use strict;

use Test::More;

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
