use utf8;
package Gerencial::Schema::Result::Banco;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Gerencial::Schema::Result::Banco

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<banco>

=cut

__PACKAGE__->table("banco");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 nome

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 agencia

  data_type: 'varchar'
  is_nullable: 0
  size: 15

=head2 conta_corrente

  data_type: 'varchar'
  is_nullable: 0
  size: 15

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "nome",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "agencia",
  { data_type => "varchar", is_nullable => 0, size => 15 },
  "conta_corrente",
  { data_type => "varchar", is_nullable => 0, size => 15 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-04-24 18:23:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s+LjuL6kBY7SAOQKDcrOHw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
