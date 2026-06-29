# Generated from Makefile.PL using makefilepl2cpanfile

requires 'Carp';
requires 'ExtUtils::MakeMaker', '6.64';
requires 'Readonly';
requires 'Scalar::Util';

on 'test' => sub {
	requires 'Error';
	requires 'IPC::System::Simple';
	requires 'Test::Compile';
	requires 'Test::DescribeMe';
	requires 'Test::Mockingbird', '0.08';
	requires 'Test::Most';
	requires 'Test::Needs';
	requires 'Test::Returns';
	requires 'Test::Warnings';
};

on 'develop' => sub {
	requires 'Devel::Cover';
	requires 'Perl::Critic';
	requires 'Test::Pod';
	requires 'Test::Pod::Coverage';
};
