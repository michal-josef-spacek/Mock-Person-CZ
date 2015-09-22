# Pragmas.
use strict;
use warnings;

# Modules.
use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Mock::Person::CZ');
}

# Test.
require_ok('Mock::Person::CZ');
