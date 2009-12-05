#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;

name 'Uploader';
all_from 'lib/Uploader.pm';

requires 'Catalyst::Runtime' => '5.80015';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'parent';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats

# Own Deps:
requires 'Catalyst::Log::Log4perl';
requires 'Catalyst::Plugin::Authentication' => '0';
requires 'Catalyst::Plugin::Session' => '0';
requires 'Catalyst::Plugin::Session::Store::FastMmap' => '0';
requires 'Catalyst::Plugin::Session::State::Cookie' => '0';
requires 'Catalyst::Plugin::Unicode::Encoding' => 0;
requires 'Config::JFDI' => 0;

Config::JFDI

catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
