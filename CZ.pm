package Mock::Person::CZ;

use base qw(Exporter);
use strict;
use utf8;
use warnings;

use Readonly;

# Constants.
Readonly::Scalar our $SPACE => q{ };
Readonly::Array our @EXPORT_OK => qw(first_male first_female middle_female
	last_male last_female middle_male middle_female name name_female
	name_male);

our $VERSION = 0.07;

our $STRICT_NUM_NAMES = 0;

# First and middle male names.
our @first_male = our @middle_male = qw(
Adam
Alexandr
Aleš
Alois
Antonín
Bedřich
Bohumil
Bohuslav
Břetislav
Dalibor
Daniel
David
Denis
Dominik
Dušan
Eduard
Emil
Filip
František
Ivan
Ivo
Jakub
Jan
Jaromír
Jaroslav
Jindřich
Jiří
Josef
Jozef
Ján
Kamil
Karel
Kryštof
Ladislav
Leoš
Libor
Lubomír
Luboš
Ludvík
Luděk
Lukáš
Marcel
Marek
Marian
Martin
Matyáš
Matěj
Michael
Michal
Milan
Miloslav
Miloš
Miroslav
Oldřich
Ondřej
Otakar
Patrik
Pavel
Petr
Přemysl
Radek
Radim
Radomír
Radovan
René
Richard
Robert
Roman
Rostislav
Rudolf
Samuel
Stanislav
Tadeáš
Tomáš
Viktor
Vilém
Vladimír
Vladislav
Vlastimil
Vojtěch
Vratislav
Václav
Vít
Vítězslav
Zbyněk
Zdeněk
Šimon
Štefan
Štěpán
);

# First and middle female names.
our @first_female = our @middle_female = qw(
Alena
Andrea
Anna
Barbora
Božena
Dagmar
Dana
Eliška
Eva
Hana
Helena
Irena
Ivana
Jana
Jarmila
Jaroslava
Jitka
Jiřina
Kateřina
Kristýna
Lenka
Libuše
Lucie
Ludmila
Marcela
Marie
Markéta
Marta
Martina
Michaela
Miroslava
Monika
Pavla
Petra
Tereza
Veronika
Vlasta
Věra
Zdeňka
Zuzana
);

# Last male names.
our @last_male = qw(
Bartoš
Beneš
Blažek
Bláha
Bureš
Doležal
Dostál
Dušek
Dvořák
Fiala
Havlíček
Holub
Horák
Hrubý
Hruška
Hájek
Janda
Jelínek
Kadlec
Kolář
Konečný
Kopecký
Kovář
Kratochvíl
Krejčí
Král
Kučera
Kříž
Liška
Mach
Malý
Marek
Mareš
Matoušek
Mašek
Moravec
Musil
Müller
Navrátil
Nguyen
Novotný
Novák
Němec
Pavlík
Pokorný
Polák
Pospíšil
Procházka
Růžička
Sedláček
Soukup
Staněk
Svoboda
Sýkora
Tichý
Urban
Valenta
Vaněk
Veselý
Vlček
Vávra
Zeman
Čech
Čermák
Černý
Říha
Ševčík
Šimek
Štěpánek
Šťastný
);

# Last female names.
our @last_female = qw(
Bartošová
Benešová
Blažková
Bláhová
Burešová
Doležalová
Dostálová
Dvořáková
Fialová
Havlíčková
Holubová
Horáková
Hrubá
Hrušková
Hájková
Jandová
Jelínková
Kadlecová
Kolářová
Konečná
Kopecká
Kovářová
Kratochvílová
Krejčová
Krejčí
Králová
Kučerová
Křížová
Lišková
Machová
Malá
Marešová
Marková
Matoušková
Mašková
Moravcová
Musilová
Müllerová
Navrátilová
Nguyen
Novotná
Nováková
Němcová
Pavlíková
Pavlíková
Pokorná
Poláková
Pospíšilová
Procházková
Růžičková
Sedláčková
Soukupová
Staňková
Svobodová
Sýkorová
Tichá
Urbanová
Valentová
Vaňková
Veselá
Vlčková
Vávrová
Zemanová
Čechová
Čermáková
Černá
Říhová
Ševčíková
Šimková
Štěpánková
Šťastná
);

# Get random first male name.
sub first_male {
	return $first_male[rand @first_male];
}

# Get random first female name.
sub first_female {
	return $first_female[rand @first_female];
}

# Get random last male name.
sub last_male {
	return $last_male[rand @last_male];
}

# Get random last female name.
sub last_female {
	return $last_female[rand @last_female];
}

# Get random middle male name.
sub middle_male {
	return $middle_male[rand @middle_male];
}

# Get random middle female name.
sub middle_female {
	return $middle_female[rand @middle_female];
}

# Get random name.
sub name {
	my $sex = shift;
	if (defined $sex && $sex eq 'female') {
		return name_female();
	} else {
		return name_male();
	}
}

sub name_female {
	my $strict_num_names = $STRICT_NUM_NAMES;
	if ($strict_num_names == 0) {
		$strict_num_names = int(rand(2)) + 2;
	}
	if ($strict_num_names == 3) {
		return first_female().$SPACE.middle_female().$SPACE.last_female();
	} elsif ($strict_num_names == 2) {
		return first_female().$SPACE.last_female();
	}
}

sub name_male {
	my $strict_num_names = $STRICT_NUM_NAMES;
	if ($strict_num_names == 0) {
		$strict_num_names = int(rand(2)) + 2;
	}
	if ($strict_num_names == 3) {
		return first_male().$SPACE.middle_male().$SPACE.last_male();
	} elsif ($strict_num_names == 2) {
		return first_male().$SPACE.last_male();
	}
}

1;

__END__

=encoding UTF-8

=cut 

=head1 NAME

Mock::Person::CZ - Generate random sets of Czech names.

=head1 SYNOPSIS

 use Mock::Person::CZ qw(first_male first_female last_male last_female
         middle_male middle_female name name_female name_male);

 my $first_male = first_male();
 my $first_female = first_female();
 my $last_male = last_male();
 my $last_female = last_female();
 my $middle_male = middle_male();
 my $middle_female = middle_female();
 my $name = name($sex);
 my $name_female = name_female();
 my $name_male = name_male();

=head1 DESCRIPTION

Data for this module was found on these pages:

=over

=item B<Last names>

L<cz.wikipedia.org|http://cs.wikipedia.org/wiki/Seznam_nej%C4%8Detn%C4%9Bj%C5%A1%C3%ADch_p%C5%99%C3%ADjmen%C3%AD_v_%C4%8Cesku>

=item B<Middle names>

There's usually no distinction between a first and middle name in the Czech Republic.

=item B<First names>

L<cz.wikipedia.org - male names|http://cs.wikipedia.org/wiki/Seznam_nej%C4%8Dast%C4%9Bj%C5%A1%C3%ADch_mu%C5%BEsk%C3%BDch_jmen_v_%C4%8Cesk%C3%A9_republice>,
L<cs.wikipedia.org - female names|http://cs.wikipedia.org/wiki/Seznam_nej%C4%8Dast%C4%9Bj%C5%A1%C3%ADch_%C5%BEensk%C3%BDch_jmen_v_%C4%8Cesk%C3%A9_republice>.

=back

=head1 SUBROUTINES

=head2 C<first_male>

 my $first_male = first_male();

Returns random first name of male person.

=head2 C<first_female>

 my $first_female = first_female();

Returns random first name of female person.

=head2 C<last_male>

 my $last_male = last_male();

Returns random last name of male person.

=head2 C<last_female>

 my $last_female = last_female();

Returns random last name of female person.

=head2 C<middle_male>

 my $middle_male = middle_male();

Returns random middle name of male person.

=head2 C<middle_female>

 my $middle_female = middle_female();

Returns random middle name of female person.

=head2 C<name>

 my $name = name($sex);

Recieves scalar with sex of the person ('male' or 'female').

Number of names is 2 or 3. What is created is defined by C<$STRICT_NUM_NAMES>
variable. See in L</VARIABLES> section.

Default value of $sex variable is 'male'.

Returns scalar with generated name.

=head2 C<name_female>

 my $name_female = name_female();

Construct Czech random female name.

Number of names is 2 or 3. What is created is defined by C<$STRICT_NUM_NAMES>
variable. See in L</VARIABLES> section.

Returns string.

=head2 C<name_male>

 my $name_male = name_male();

Construct Czech random male name.

Number of names is 2 or 3. What is created is defined by C<$STRICT_NUM_NAMES>
variable. See in L</VARIABLES> section.

Returns string.

=head1 VARIABLES

=over

=item C<$STRICT_NUM_NAMES>

Variable which control number of generated names.

Possible values:

 0 - Random between 2 and 3 choice (default value).
 2 - First and last name.
 3 - First, middle and last name.

=back

=head1 EXAMPLE1

 use strict;
 use warnings;

 use Encode qw(encode_utf8);
 use Mock::Person::CZ qw(name);

 # Error.
 print encode_utf8(name())."\n";

 # Output like.
 # Štefan Lukáš Šimek

=head1 EXAMPLE2

 use strict;
 use warnings;

 use Encode qw(encode_utf8);
 use Mock::Person::CZ;

 # Get all last male names.
 my @last_males = @Mock::Person::CZ::last_male;

 # Print out.
 print sort map { encode_utf8($_)."\n" } @last_males;

 # Output:
 # Bartoš
 # Beneš
 # Blažek
 # Bláha
 # Bureš
 # Doležal
 # Dostál
 # Dušek
 # Dvořák
 # Fiala
 # Havlíček
 # Holub
 # Horák
 # Hrubý
 # Hruška
 # Hájek
 # Janda
 # Jelínek
 # Kadlec
 # Kolář
 # Konečný
 # Kopecký
 # Kovář
 # Kratochvíl
 # Krejčí
 # Král
 # Kučera
 # Kříž
 # Liška
 # Mach
 # Malý
 # Marek
 # Mareš
 # Matoušek
 # Mašek
 # Moravec
 # Musil
 # Müller
 # Navrátil
 # Nguyen
 # Novotný
 # Novák
 # Němec
 # Pavlík
 # Pokorný
 # Polák
 # Pospíšil
 # Procházka
 # Růžička
 # Sedláček
 # Soukup
 # Staněk
 # Svoboda
 # Sýkora
 # Tichý
 # Urban
 # Valenta
 # Vaněk
 # Veselý
 # Vlček
 # Vávra
 # Zeman
 # Čech
 # Čermák
 # Černý
 # Říha
 # Ševčík
 # Šimek
 # Štěpánek
 # Šťastný

=head1 DEPENDENCIES

L<Exporter>,
L<Readonly>.

=head1 SEE ALSO

=over

=item L<Task::Mock::Person>

Install the Mock::Person modules.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Mock-Person-CZ>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2013-2023 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.07

=cut
