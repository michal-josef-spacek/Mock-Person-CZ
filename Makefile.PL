# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Generate random sets of Czech names.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'Mock-Person-CZ';
readme_from 'CZ.pm';
requires 'Exporter' => 0;
requires 'Readonly' => 0;
requires 'perl' => '5.8.0';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Mock-Person-CZ';
resources 'homepage' => 'https://github.com/tupinek/Mock-Person-CZ';
resources 'repository' => 'git://github.com/tupinek/Mock-Person-CZ';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'List::MoreUtils' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.03';

# Run.
WriteAll();
