package Map::Tube::Prague;

# Pragmas.
use strict;
use warnings;
use 5.006;

# Modules.
use File::Share ':all';
use Moo;
use namespace::clean;

# Version.
our $VERSION = 0.03;

# Get XML.
has xml => (
	'is' => 'ro',
	'default' => sub {
		return dist_file('Map-Tube-Prague', 'prague-map.xml');
	},
);

with 'Map::Tube';

1;

__END__

=encoding utf8

=head1 NAME

Map::Tube::Prague - Interface to the Prague Tube Map.

=head1 SYNOPSIS

 use Map::Tube::Prague;
 my $obj = Map::Tube::Prague->new;
 my $station = $obj->get_node_by_id($station_id);
 my $station = $obj->get_node_by_name($station_name);
 my $route = $obj->get_shortest_route($from, $to);
 my $xml_file = $obj->xml;

=head1 DESCRIPTION

It currently provides functionality to find the shortest route between the two
given nodes.

For more information about Prague Map, click L<here|https://en.wikipedia.org/wiki/Prague_Metro>.

=head1 METHODS

=over 8

=item C<new()>

 Constructor.

=item C<get_node_by_id($station_id)>

 Get station node by id.
 Returns Map::Tube::Node object.

=item C<get_node_by_name($station_name)>

 Get station node by name.
 Returns Map::Tube::Node object.

=item C<get_shortest_route($from, $to)>

 Get shortest route between $from and $to node name. Node name is case insensitive.
 Returns back the node sequence in string.

=item C<xml()>

 Get XML specification of Prague metro.
 Returns string with XML.

=back

=head1 EXAMPLE1

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Encode qw(decode_utf8 encode_utf8);
 use Map::Tube::Prague;

 # Object.
 my $obj = Map::Tube::Prague->new;

 # Get route.
 my $route = $obj->get_shortest_route(decode_utf8('Dejvická'), decode_utf8('Ládví'));

 # Print out type.
 print "Route: ".encode_utf8($route)."\n";

 # Output:
 # Route: Dejvická (Linka A), Hradčanská (Linka A), Malostranská (Linka A), Staroměstská (Linka A), Můstek (Linka A,Linka B), Muzeum (Linka A,Linka C), Hlavní nádraží (Linka C), Florenc (Linka C), Vltavská (Linka C), Nádraží Holešovice (Linka C), Kobylisy (Linka C), Ládví (Linka C)

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use utf8;
 use warnings;

 # Modules.
 use Map::Tube::Prague;

 # Object.
 my $obj = Map::Tube::Prague->new;

 # Get XML file.
 my $xml_file = $obj->xml;

 # Print out XML file.
 print "XML file: $xml_file\n";

 # Output like:
 # XML file: .*/prague-map.xml

=head1 DEPENDENCIES

L<File::Share>,
L<Map::Tube>,
L<Moo>,
L<namespace::clean>.

=head1 SEE ALSO

L<Map::Tube>,
L<Map::Tube::Barcelona>,
L<Map::Tube::Delhi>,
L<Map::Tube::London>,
L<Map::Tube::NYC>,
L<Map::Tube::Sofia>,
L<Map::Tube::Tokyo>,
L<Map::Tube::Warsaw>.

=head1 REPOSITORY

L<https://github.com/Manwar/Map-Tube-Prague>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © 2014 Michal Špaček
 Artistic License
 BSD 2-Clause License

=head1 VERSION

0.03

=cut
