package Uploader::Model::DataBase;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'Uploader::Schema',
);

=head1 NAME

Upload::Model::DataBase - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<Uploader>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<Uploader::Schema>

=head1 AUTHOR

Stephan Jauernick,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

