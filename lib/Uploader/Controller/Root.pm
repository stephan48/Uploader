package Uploader::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

Uploader::Controller::Root - Root Controller for Uploader

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
#    $c->response->body( $c->welcome_message );
	$c->stash->{template} = "index.tt2";
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->stash->{template}  = 'index.tt2';
    $c->stash->{error_msg} = 'Page not Found!';
    $c->response->status(404);
}

=head2 access_denied

    Handle Catalyst::Plugin::Authorization::ACL access denied exceptions

=cut

sub access_denied : Private {
        my ($self, $c) = @_;

    $c->stash->{template}  = 'index.tt2';
    $c->stash->{error_msg} = 'Sorry but you dont\'t have sufficent permissions to access the page!';
    $c->response->status(403);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Stephan Jauernick,None,None,Hidden,Administrator

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
