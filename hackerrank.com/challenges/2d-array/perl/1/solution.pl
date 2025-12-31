#!/usr/bin/perl

use strict;
use warnings;

#
# Complete the 'hourglassSum' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY arr as parameter.
#

use List::Util qw(sum);

use constant ARRAY_SIZE => 6;

sub _hourglass_at {
  my ($arr, $i, $j) = @_;
  my @result = (
    $arr->[$i-1][$j-1], $arr->[$i-1][$j], $arr->[$i-1][$j+1],
                        $arr->[$i][$j],
    $arr->[$i+1][$j-1], $arr->[$i+1][$j], $arr->[$i+1][$j+1],
  );
  return \@result;
}

sub hourglasses {
    my $arr = shift;
    my @result;
    for my $row (1..(ARRAY_SIZE-1)) {
      for my $col (1..(ARRAY_SIZE-1)) {
        push @result, _hourglass_at($arr, $row, $col);
      }
    }
    return \@result;
}

sub hourglassSum {
  # Write your code here
  my $arr = shift;
  
  my @hourglass_sums_sorted_desc = 
    sort {$b <=> $a}
    map { sum(@$_) }
    @{hourglasses($arr)};
    
  return $hourglass_sums_sorted_desc[0];
}

sub main {

  my @arr = ();

  for (1..ARRAY_SIZE) {
    my $arr_line = <STDIN>;
    $arr_line =~ s/^\s+|\s+$//gs;

    my @arr_row = split(/\s+/,$arr_line);

    push @arr, \@arr_row;
  }

  my $result = hourglassSum(\@arr);

  open(my $fptr, '>', $ENV{'OUTPUT_PATH'});
  print $fptr "$result\n";
  close $fptr;

}

main(@ARGV);
