# NAME

Params::Validate::Get - Get the parameters to a subroutine in any way you want

# VERSION

Version 0.01

# SYNOPSIS

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

# METHODS

## get\_params

Parse the arguments given to a function.
Processes arguments passed to methods and ensures they are in a usable format,
allowing the caller to call the function in anyway that they want
e.g. foo('bar'), foo(arg => 'bar'), foo({ arg => 'bar' }) all mean the same
when called \_get\_params('arg', @\_);

# AUTHOR

Nigel Horne, `<njh at bandsman.co.uk>`

# BUGS

# SEE ALSO

- [Params::Validate::Strict](https://metacpan.org/pod/Params%3A%3AValidate%3A%3AStrict)

# SUPPORT

This module is provided as-is without any warranty.

Please report any bugs or feature requests to `bug-params-validate-get at rt.cpan.org`,
or through the web interface at
[http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Params-Validate-Get](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Params-Validate-Get).
I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

You can find documentation for this module with the perldoc command.

    perldoc Params::Validate::Get

You can also look for information at:

- MetaCPAN

    [https://metacpan.org/dist/Params-Validate-Get](https://metacpan.org/dist/Params-Validate-Get)

- RT: CPAN's request tracker

    [https://rt.cpan.org/NoAuth/Bugs.html?Dist=Params-Validate-Get](https://rt.cpan.org/NoAuth/Bugs.html?Dist=Params-Validate-Get)

- CPAN Testers' Matrix

    [http://matrix.cpantesters.org/?dist=Params-Validate-Get](http://matrix.cpantesters.org/?dist=Params-Validate-Get)

- CPAN Testers Dependencies

    [http://deps.cpantesters.org/?module=Params::Validate::Get](http://deps.cpantesters.org/?module=Params::Validate::Get)

# LICENSE AND COPYRIGHT

Copyright 2025 Nigel Horne.

This program is released under the following licence: GPL2
