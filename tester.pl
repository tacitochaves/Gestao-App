#!/usr/bin/env perl

use warnings;
use strict;

use FindBin;

use lib "$FindBin::Bin/lib";

use Data::Dumper;
use Gerencial::Schema;

my $schema = Gerencial::Schema->init_db->resultset('Banco');



my $cria_banco = $schema->create(
    {
        nome           => "Tacito",
        agencia        => "Chaves",
        conta_corrente => "1523658",
    }
);

print Dumper $cria_banco;
