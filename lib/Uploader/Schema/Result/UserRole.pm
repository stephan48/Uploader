package Uploader::Schema::Result::UserRole;

use utf8;
use strict;
use warnings;
use base 'DBIx::Class';

__PACKAGE__->load_components(qw/ForceUTF8 Core/);
__PACKAGE__->table("user_role");
__PACKAGE__->add_columns(
    "user_id",
    {
        data_type => "INTEGER",
        default_value => undef,
        is_nullable => 0,
    },
    "role_id",
    {
        data_type =>"INTEGER",
        default_value => undef,
        is_nullable => 0,
    },
);

__PACKAGE__->set_primary_key("user_id", "role_id" );

__PACKAGE__->belongs_to( "user_id", "Uploader::Schema::Result::User", { id => "user_id" },);
__PACKAGE__->belongs_to( "role_id", "Uploader::Schema::Result::Role", { id => "role_id" });

1;
