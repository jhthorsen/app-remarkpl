use Mojo::Base -strict;
use Mojo::File 'path';
use Test::Mojo;
use Test::More;

$ENV{MOJO_APP_LOADER} = 1;
plan skip_all => $@ unless do(path(qw(script remarkpl))->to_abs);
my $t = Test::Mojo->new;

$t->get_ok('/')->status_is(200);
$t->get_ok('/fonts.css')->status_is(200);
$t->get_ok('/basic.css')->status_is(200);
$t->get_ok('/remark.min.js')->status_is(200);
$t->get_ok('/custom.js')->status_is(200);

done_testing;
