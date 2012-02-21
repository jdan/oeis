# OEIS

## About

This a gem to interface the [On-Line Encyclopedia of Integer Sequences](http://oeis.org) 
(OEIS). It allows you to search for a documented sequence using a Ruby Fixnum Array as
input.

## Usage

    > require 'oeis'
    > ls = 3.upto(10).collect { |i| i*i }
    [9, 16, 25, 36, 49, 64, 81, 100] 
    > result = OEIS::search(ls)
    
    > p result.title
    The squares: a(n) = n^2.
    > p result.id
    A000290
    > p result.sequence
    [0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100 ...
    
## Installation

    git clone git@github.com:prezjordan/oeis.git
    cd oeis
    bundle
    gem build oeis.gemspec
    gem install oeis-X.X.X.gem
    
**OR**

    gem install oeis
    
## Why?

I started working on this gem after my roommate's snoring kept me from sleeping. It is my
first gem, so there's a *very* good chance I did something wrong, or did something 
not-so-right. 

Numbers have always been a passion of mine, so this servers as a simple educational tool.
Generating numbers is fun, seeing various properties of the numbers you just generated is
even cooler.

## LICENSE

Include license information here.