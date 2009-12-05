package Uploader::Schema::Result::User;

use utf8;
use strict;
use warnings;
use base 'DBIx::Class';

__PACKAGE__->load_components(qw/ForceUTF8 EncodedColumn Core/);
__PACKAGE__->table("user");
__PACKAGE__->add_columns(
    "id",
    {
        data_type => "SERIAL",
        default_value => undef,
        is_nullable => 0,
        size => 11,
    },
    "username",
    {
        data_type =>"TEXT",
        default_value => undef,
        is_nullable => 0,
    },
    "password",
    {
        data_type => "TEXT",
        default_value => undef,
        is_nullable => 0,
        encode_column       => 1,
        encode_class        => 'Digest',
        encode_args         => {salt_length => 10},
        encode_check_method => 'check_password',
    },
    "email_address",
    {
        data_type => 'TEXT',
        default_value => undef,
        is_nullable => 0,
    },
    "first_name",
    {
        data_type => 'TEXT',
        default_value => undef,
        is_nullable => 0,
    },
    "last_name",
    {
        data_type => 'TEXT',
        default_value => undef,
        is_nullable => 0,
    },
    "active",
    {
        data_type => 'integer',
        default_value => undef,
        is_nullable => 0,
    },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many('map_user_roles' => 'LinuxRulz::Schema::Result::UserRoles',{ "foreign.userid" => "self.id" });
__PACKAGE__->many_to_many(roles => 'map_user_roles', 'role');


=head 2 has_role

Check if a user has the specified role

=cut

use Perl6::Junction qw/any/;
sub has_role {
    my ($self, $role) = @_;

    # Does this user posses the required role?
    return any(map { $_->role } $self->roles) eq $role;
}

1;
