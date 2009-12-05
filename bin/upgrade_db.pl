#!/usr/bin/perl
use strict;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Uploader::Schema;
use Config::JFDI;

my $config = Config::JFDI->new(name => "linuxrulz", path => "/home/linuxrulz/catalyst/LinuxRulz/");

my $schema = Uploader::Schema->connect($config->get->{'Model::DataBase'}->{'connect_info'});

if (!$schema->get_db_version()) {
    # schema is unversioned
    $schema->deploy();
} else {
    $schema->upgrade();
}
