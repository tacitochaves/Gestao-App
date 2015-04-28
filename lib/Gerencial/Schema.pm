use utf8;
package Gerencial::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-04-24 18:23:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aZb2/OxIF85Ps44ppK5Hfw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

sub init_db {
    return __PACKAGE__->connect(
        'dbi:mysql:dbname=Gerencial;host=192.168.5.205',
        'chaves',
        'ildenice',
        { mysql_enable_utf8 => 1 }
    );
}

1;
