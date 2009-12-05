#!/usr/bin/perl
use strict;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Pod::Usage;
use Getopt::Long;
use Config::JFDI;

use Uploader::Schema;

my ( $preversion, $help );

GetOptions(
        'p|preversion:s'  => \$preversion,
) or die pod2usage;

my $config = Config::JFDI->new(name => "uploader", path => "$FindBin::Bin/../");

my $schema = Uploader::Schema->connect($config->get->{'Model::DataBase'}->{'connect_info'});

my $version = $schema->schema_version();

if ($version && $preversion) {
    print "creating diff between version $version and $preversion\n";
} elsif ($version && !$preversion) {
    print "creating full dump for version $version\n";
} elsif (!$version) {
    print "creating unversioned full dump\n";
}

my $sql_dir = "$FindBin::Bin/../root/sql/";
$schema->create_ddl_dir( 'PostgreSQL', $version, $sql_dir, $preversion );
