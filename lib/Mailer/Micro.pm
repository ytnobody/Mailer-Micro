package Mailer::Micro;
use 5.008005;
use strict;
use warnings;
use Mailer::Micro::Transport;
use Email::Simple;

sub new {
    my ($class, $type, $opts) = @_;
    my $transport = Mailer::Micro::Transport->new($type => $opts);
    bless {transport => $transport}, $class;
}

sub send {
    my ($self, $mailtext) = @_;
    my $email = ref($mailtext) eq 'Email::Simple' ? $mailtext : Email::Simple->new($mailtext);
    $self->{transport}->send($email);
}

our $VERSION = "0.01";



1;
__END__

=encoding utf-8

=head1 NAME

Mailer::Micro - It's new $module

=head1 SYNOPSIS

    use Mailer::Micro;
    my $mailer = Mailer::Micro->new(SMTP => ['mailhost', Timeout => 30]);
    my $result = $mailer->send($mailtext);

=head1 DESCRIPTION

Mailer::Micro is ...

=head1 LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

ytnobody E<lt>ytnobody@gmail.comE<gt>

=cut

