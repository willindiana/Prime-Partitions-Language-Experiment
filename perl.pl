#!bin/usr/perl
use 5.18.2;
use strict;
use warnings;
use Scalar::Util qw(looks_like_number);

say("Please enter a number (enter non-number to exit):");
while(<STDIN>) {
    if(!looks_like_number($_)) {
        exit;
    }
    prime_partitions($_, 1, ());
    say("Please enter a number (enter non-number to exit):");
}

sub is_prime {
    my($n) = shift;

    if($n <= 1) {
        return 0;
    }
    for $a (2..($n-1)) {
        if ($n % $a == 0) {
            return 0;
        }
    }
    return 1;
}

sub primes {
    my($a) = shift;
    my($b) = shift;
    my($number, @out);
    for $number ($a..$b) {
        if(is_prime($number) == 1) {
            @out = (@out, $number);
        }
    }
    @out
}

sub prime_partitions {
    my($n) = shift;
    my($k) = shift;
    my(@lst) = @_;

    if($n == 0) {
        say(join(' + ', @lst));
    }

    if($n > $k) {
        for my $p (primes(($k + 1), $n)) {
            prime_partitions(($n - $p), $p, (@lst, $p));
        }
    }
}