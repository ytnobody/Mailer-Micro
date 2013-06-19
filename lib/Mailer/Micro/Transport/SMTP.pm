package Mailer::Micro::Transport::SMTP;
use strict;
use warnings;
use Net::SMTP;
use Email::Address::Loose;

sub new {
    my ($class, $opts) = @_;
    bless {opts => $opts}, $class;
}

sub send {
    my ($class, $email) = @_;
    my $smtp = Net::SMTP->new(@{$self->{opts}}) or die "could not connect to SMTP Server : $!";
    $smtp->mail($email->header('From'));
    $smtp->to(split(',', $email->header('To')));
    $smtp->cc(split(',', $email->header('Cc'))) if $email->header('Cc');
    $smtp->bcc(split(',', $email->header('Bcc'))) if $email->header('Bcc');
}

1;
