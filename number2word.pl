#!/usr/bin/perl
# number2word.pl by Tony Wei for covert numbers to words
use strict;
use warnings;
use Getopt::Long;

my $NUMBER;

my $opts = GetOptions(
        'number|i=i' => \$NUMBER,
        );

my %single_number = (
        '1' => 'one',
        '2' => 'two',
        '3' => 'three',
        '4' => 'four',
        '5' => 'five',
        '6' => 'six',
        '7' => 'seven',
        '8' => 'eight',
        '9' => 'nine',
);

my %teen_number = (
        '10' => 'ten',
        '11' => 'eleven',
        '12' => 'twelve',
        '13' => 'thirteen',
        '14' => 'fourteen',
        '15' => 'fifteen',
        '16' => 'sixteen',
        '17' => 'seventeen',
        '18' => 'eightteen',
        '19' => 'ninteen',
);

my %ty_number = (
        '2' => 'twenty',
        '3' => 'thirty',
        '4' => 'forty',
        '5' => 'fifty',
        '6' => 'sixty',
        '7' => 'seventy',
        '8' => 'eighty',
        '9' => 'ninty',
);

if ($NUMBER < 1 || $NUMBER > 999) {
        print "$NUMBER is beyond the range of 1~999.\n";
}
else {
        my $word;
        my @digits = split("", $NUMBER);

        if (scalar(@digits) == 1) {
                $word = $single_number{$NUMBER};
        }
        elsif (scalar(@digits) == 2) {
                if ($digits[0] == 1) {
                        $word = $teen_number{$NUMBER};
                }
                elsif ($digits[1] == 0) {
                        $word = $ty_number{$digits[0]};
                }
                else {
                        $word = $ty_number{$digits[0]}."_".$single_number{$digits[1]};
                }
        }
        else {
                if ($digits[1] == 0 && $digits[2] == 0) {
                        $word = $single_number{$digits[0]}." hundred";
                }
                else {
                        $word = $single_number{$digits[0]}." hundred and ";
                        if ($digits[1] == 0) {
                                $word = $word.$single_number{$digits[2]};
                        }
                        elsif ($digits[1] == 1) {
                                $word = $word.$teen_number{join("", @digits[1,2])};
                        }
                        elsif ($digits[2] == 0) {
                                $word = $word.$ty_number{$digits[1]};
                        }
                }
                else {
                        $word = $ty_number{$digits[0]}."-".$single_number{$digits[1]};
                }
        }
        else {
                if ($digits[1] == 0 && $digits[2] == 0) {
                        $word = $single_number{$digits[0]}." hundred";
                }
                else {
                        $word = $single_number{$digits[0]}." hundred and ";
                        if ($digits[1] == 0) {
                                $word = $word.$single_number{$digits[2]};
                        }
                        elsif ($digits[1] == 1) {
                                $word = $word.$teen_number{join("", @digits[1,2])};
                        }
                        elsif ($digits[2] == 0) {
                                $word = $word.$ty_number{$digits[1]};
                        }
                        else {
                                $word = $word.$ty_number{$digits[1]}."-".$single_number{$digits[2]};
                        }
                }
        }       

        print "The word for $NUMBER is '$word'.\n";
}