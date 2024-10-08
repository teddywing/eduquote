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


package Bin;

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT = qw($BIN);

use File::Spec;

our $BIN = File::Spec->rel2abs('eduquote');

1;
