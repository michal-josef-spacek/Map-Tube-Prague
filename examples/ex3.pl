#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Map::Tube::GraphViz;
use Map::Tube::GraphViz::Utils qw(node_color_without_label);
use Map::Tube::Prague;

# Object.
my $obj = Map::Tube::Prague->new;

# GraphViz object.
my $g = Map::Tube::GraphViz->new(
        'callback_node' => \&node_color_without_label,
        'driver' => 'neato',
        'tube' => $obj,
); 

# Get graph to file.
$g->graph('Prague.png');

# Print file.
system "ls -l Prague.png";

# Output like:
# -rw-r--r-- 1 skim skim 292500 Dec 21 17:25 Prague.png