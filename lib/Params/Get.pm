package Params::Get;

use strict;
use warnings;
use Carp;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(get_params);

=head1 NAME

Params::Get - Get the parameters to a subroutine in any way you want

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    use Params::Get;
    use Params::Validate::Strict;

    sub where_am_i
    {
        my $params = Params::Validate::Strict({
		args => Params::Get::get_params(undef, @_),
		schema => {
			'latitude' => {
				type => 'number',
				min => -180,
				max => 180
			}, 'longitude' => {
				type => 'number',
				min => -180,
				max => 180
			}
		}
	});

	print 'You are at ', $params->{'latitude'}, ', ', $params->{'longitude'}, "\n";
    }

=head1	METHODS

=head2 get_params

Parse the arguments given to a function.
Processes arguments passed to methods and ensures they are in a usable format,
allowing the caller to call the function in any way that they want
e.g. foo('bar'), foo(arg => 'bar'), foo({ arg => 'bar' }) all mean the same
when called _get_params('arg', @_);

=cut

sub get_params
{
	my $default = shift;

	# Directly return hash reference if the first parameter is a hash reference
	return $_[0] if(ref($_[0]) eq 'HASH');

	my %rc;
	my $num_args = scalar(@_);

	# Populate %rc based on the number and type of arguments
	if(($num_args == 1) && defined($default)) {
		# %rc = ($default => shift);
		return { $default => shift };
	} elsif($num_args == 1) {
		Carp::croak('Usage: ', __PACKAGE__, '->', (caller(1))[3], '()');
	} elsif(($num_args == 0) && defined($default)) {
		Carp::croak('Usage: ', __PACKAGE__, '->', (caller(1))[3], "($default => \$val)");
	} elsif($num_args == 0) {
		return;
	} elsif(($num_args % 2) == 0) {
		%rc = @_;
	} else {
		Carp::croak('Usage: ', __PACKAGE__, '->', (caller(1))[3], '()');
	}

	return \%rc;
}

=head1 AUTHOR

Nigel Horne, C<< <njh at bandsman.co.uk> >>

=head1 BUGS

=head1 SEE ALSO

=over 4

=item * L<Params::Validate::Strict>

=back

=head1 SUPPORT

This module is provided as-is without any warranty.

Please report any bugs or feature requests to C<bug-params-get at rt.cpan.org>,
or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Params-Get>.
I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

You can find documentation for this module with the perldoc command.

    perldoc Params::Get

You can also look for information at:

=over 4

=item * MetaCPAN

L<https://metacpan.org/dist/Params-Get>

=item * RT: CPAN's request tracker

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=Params-Get>

=item * CPAN Testers' Matrix

L<http://matrix.cpantesters.org/?dist=Params-Get>

=item * CPAN Testers Dependencies

L<http://deps.cpantesters.org/?module=Params::Get>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2025 Nigel Horne.

This program is released under the following licence: GPL2

=cut

1;

__END__
