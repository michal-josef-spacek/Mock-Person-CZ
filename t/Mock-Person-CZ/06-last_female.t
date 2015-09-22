# Pragmas.
use strict;
use warnings;

# Modules.
use Mock::Person::CZ qw(last_female);
use List::MoreUtils qw(any);
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $ret1 = last_female();
like($ret1, qr{^\w+$}, 'Last female must be one word.');

# Test.
my @last_females = @Mock::Person::CZ::last_female;
my $ret2 = any { $ret1 eq $_ } @last_females;
is($ret2, 1, 'Last female is from last female names list.');
