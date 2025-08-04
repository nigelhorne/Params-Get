use strict;
use warnings;
use Test::Most;

BEGIN {
	use_ok('Params::Get');
}

# Hashref as sole argument
is_deeply(Params::Get::get_params({ foo => 'bar' }), { foo => 'bar' }, 'Single hashref returns directly');

# Default + scalar
is_deeply(Params::Get::get_params('country', 'US'), { country => 'US' }, 'Default with scalar value');

# Default + arrayref
is_deeply(Params::Get::get_params('tags', ['perl', 'testing']), { tags => ['perl', 'testing'] }, 'Default with arrayref');

# Default + scalar ref
my $scalar = 'value';
is_deeply(Params::Get::get_params('key', \$scalar), { key => 'value' }, 'Default with scalar ref');

# Default + empty arrayref
is_deeply(Params::Get::get_params('list', []), { list => [] }, 'Default with empty array');

# Default + code ref
my $code = sub { 'hello' };
is_deeply(Params::Get::get_params('run', $code), { run => $code }, 'Default with code ref');

# Default + array ref of 2 elements matching special form
is_deeply(Params::Get::get_params('country', ['country', 'US']), { country => 'US' }, 'Special arrayref matching default');

# Even number of args converted to hash
is_deeply(Params::Get::get_params(undef, 'key1', 'val1', 'key2', 'val2'), { key1 => 'val1', key2 => 'val2' }, 'Key-value pairs converted to hash');

# Zero args + defined default triggers croak
throws_ok { Params::Get::get_params('required') } qr/Usage:/, 'Croak with zero args and defined default';

done_testing();
