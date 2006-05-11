#!/usr/bin/perl -w

use strict;

use Module::Build;

Module::Build->new(
	module_name => 'Tie::RefHash',
	license => 'perl',
	requires => {
		'perl'	=> '>= 5.005',
	},
	create_makefile_pl => 'traditional',
	sign => 1,
)->create_build_script;

