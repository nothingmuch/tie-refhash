#!/usr/bin/perl -tw

use strict;
use warnings;

use Test::More tests => 2;

use Tie::RefHash;

{
  package Moose;
  sub new { bless { }, shift };

  package Elk;
  our @ISA = "Moose";
}


my $obj = Moose->new;

tie my %hash, "Tie::RefHash";

$hash{$obj} = "magic";

is( $hash{$obj}, "magic", "keyed before rebless");

bless $obj, "Elk";

is( $hash{$obj}, "magic", "still the same");
