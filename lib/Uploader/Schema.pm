package Uploader::Schema;

use utf8;
use strict;
use warnings;

use base 'DBIx::Class::Schema';
our $VERSION = '0.0002';

__PACKAGE__->load_namespaces;
__PACKAGE__->load_components(qw/Schema::Versioned/);
__PACKAGE__->upgrade_directory('/home/stephan/catalyst/Uploader/root/sql/');

#use FindBin;

#warn $FindBin::Bin;
