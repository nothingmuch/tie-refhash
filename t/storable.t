#!/usr/bin/perl -tw

use strict;
use warnings;

use Test::More tests => 24;

use Tie::RefHash;

use Storable qw/dclone nfreeze thaw/;

tie my %hash, "Tie::RefHash";

my $key = { foo => 1 };
$hash{$key} = "value";
$hash{non_ref} = "other";

foreach my $clone ( \%hash, dclone(\%hash), thaw(nfreeze(\%hash)) ){
  my $clone = dclone(\%hash);

  ok( tied(%$clone), "copy is tied");
  isa_ok( tied(%$clone), "Tie::RefHash" );

  my @keys = keys %$clone;
  is( scalar(@keys), 2, "one key in clone");
  my $key = ref($keys[0]) ? shift @keys : pop @keys;
  my $reg = $keys[0];

  ok( ref($key), "key is a ref after clone" );
  is( $key->{foo}, 1, "key serialized ok");

  is( $clone->{$key}, "value", "and is still pointing at the same value" );

  ok( !ref($reg), "regular key is non ref" );
  is( $clone->{$reg}, "other", "and is also a valid key" );
}


