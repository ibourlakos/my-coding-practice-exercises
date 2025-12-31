# https://www.hackerrank.com/challenges/ctci-array-left-rotation/

#!/usr/bin/perl

use strict;
use warnings;

# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER_ARRAY a
#  2. INTEGER d
#

sub rotLeft {
    my ($arr, $d) = @_;
    my $arr_size = scalar(@$arr);
    $d %= $arr_size;
    for my $i (1..$d) {
      push(@$arr, shift(@$arr));
    }
    return @$arr;
}

open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

my @first_multiple_input = split /\s+/, rtrim(my $first_multiple_input_temp = <STDIN>);

my $n = $first_multiple_input[0];

my $d = $first_multiple_input[1];

my $a = rtrim(my $a_temp = <STDIN>);

my @a = split /\s+/, $a;

my @result = rotLeft \@a, $d;

print $fptr join " ", @result;
print $fptr "\n";

close $fptr;

sub ltrim {
    my $str = shift;

    $str =~ s/^\s+//;

    return $str;
}

sub rtrim {
    my $str = shift;

    $str =~ s/\s+$//;

    return $str;
}
