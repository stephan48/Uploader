package Uploader;

use strict;
use warnings;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use parent qw/Catalyst/;


use Catalyst::Log::Log4perl;

use Catalyst qw/-Debug
				+CatalystX::SimpleLogin
                ConfigLoader
                Static::Simple

				StackTrace
				
				Authentication

                Session
                Session::Store::FastMmap
				Session::State::Cookie

				Unicode::Encoding
/;

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in uploader.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
	name => 'Uploader',
	encoding => 'UTF-8',
	'Controller::Login' => {
	    traits => ['Logout'],
    },
);

__PACKAGE__->log( Catalyst::Log::Log4perl->new(__PACKAGE__->path_to('Log4perl.conf')->stringify ) );

# Start the application
__PACKAGE__->setup();


=head1 NAME

Uploader - Catalyst based application

=head1 SYNOPSIS

    script/uploader_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Uploader::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Stephan Jauernick,None,None,Hidden,Administrator

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
