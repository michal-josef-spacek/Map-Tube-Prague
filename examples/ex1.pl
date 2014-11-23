#!/usr/bin/env perl

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
# Route: Dejvická, Hradčanská, Malostranská, Staroměstská, Náměstí Republiky, Vltavská, Nádraží Holešovice, Kobylisy, Ládví