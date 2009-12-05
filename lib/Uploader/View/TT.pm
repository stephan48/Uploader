package Uploader::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config(
	TEMPLATE_EXTENSION => '.tt2',
    INCLUDE_PATH => [
    	Uploader->path_to( 'root/src' ),
    ],
    TIMER              => 1,
	WRAPPER => 'wrapper.tt2',
    STAT_TTL => 60,  # one minute
    COMPILE_EXT => '.tt2c',
    COMPILE_DIR => Uploader->path_to( 'root/srccompiled' ),
    RELATIVE  => 1,
    ABSOLUTE  => 1,
);


=head1 NAME

Uploader::View::TT - TT View for Uploader

=head1 DESCRIPTION

TT View for Uploader. 

=head1 SEE ALSO

L<Uploader>

=head1 AUTHOR

Stephan Jauernick,None,None,Hidden,Administrator

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
