# Task URL: https://www.hackerrank.com/challenges/crush
#
# Method:
#   Normalize queries to 0-index
#   Initialize a zero-array
#   Execute every query on the array cell-by-cell
#
# NOTE: fails at time limits, needs optimization

#!/usr/bin/perl

use strict;
use warnings;

#
# Complete the 'arrayManipulation' function below.
#
# The function is expected to return a LONG_INTEGER.
# The function accepts following parameters:
#  1. INTEGER n
#  2. 2D_INTEGER_ARRAY queries
#

sub arrayManipulation {
  my ($n, $queries) = @_;
  my @array;
  my $max_value = 0;
  
  # normalize queries from one-index to zero-index
  my @normal_queries = map { [ $_->[0]-1, $_->[1]-1, $_->[2] ] } @$queries;
  
  # for each query
  for my $query (@normal_queries) {
    # get the index range to be affected and the value to be added
    my ($left, $right, $value) = @$query;
    # add the value in each cell
    for my $index ($left..$right) {
      # initialize cell, just in case
      $array[$index] //= 0;
      # add the value to cell
      $array[$index] += $value;
      # BTW, track the max value
      $max_value = ($array[$index] > $max_value) ? $array[$index] : $max_value;
    }
  }
  
  return $max_value;
}

# Code below was given as it is

open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

my @first_multiple_input = split /\s+/, rtrim(my $first_multiple_input_temp = <STDIN>);

my $n = $first_multiple_input[0];

my $m = $first_multiple_input[1];

my @queries = ();

for (1..$m) {
    my $queries_item = rtrim(my $queries_item_temp = <STDIN>);

    my @queries_item = split /\s+/, $queries_item;

    push @queries, \@queries_item;
}

my $result = arrayManipulation $n, \@queries;

print $fptr "$result\n";

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
