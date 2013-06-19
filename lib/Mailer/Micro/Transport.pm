package Mailer::Micro::Transport;
use strict;
use warnings;
use File::Spec;

our %LOADED;

sub new {
    my ($class, $type, $opts) = @_;
    my $subclass = $class.'::'.$type;
    unless ($LOADED{$subclass}) {
        $LOADED{$subclass} = require File::Spec->catfile(split('::', $subclass.'pm'));
    }
    return $subclass->new($opts);
}

1;
