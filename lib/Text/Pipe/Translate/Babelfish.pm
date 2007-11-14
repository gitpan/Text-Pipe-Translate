package Text::Pipe::Translate::Babelfish;

use strict;
use warnings;
use LWP::UserAgent;


our $VERSION = '0.01';


use base qw(Text::Pipe::Translate);


sub init {
    my $self = shift;
    $self->SUPER::init(@_);

    Lingua::Translate::config(
        back_end      => "Babelfish",
        babelfish_uri => 'http://babelfish.altavista.com/tr?',
        ua            => LWP::UserAgent->new,
    );

}


1;


__END__



=head1 NAME

Text::Pipe::Translate::Babelfish - Translate text using Babelfish

=head1 SYNOPSIS

    use Text::Pipe 'pipe';
    my $pipe = pipe 'Translate::Babelfish', from => 'en', to => 'de';
    my $german = $pipe->filter('My hovercraft is full of eels.'),

=head1 DESCRIPTION

This pipe segment can translate text from one language to another. To do so it
uses L<Lingua::Translate>'s Babelfish backend.

Text::Pipe::Translate::Babelfish inherits from L<Text::Pipe::Translate>.

Methods inherited from L<Text::Pipe::Translate>:

     clear_from(), clear_to(), clear_translators(), from(), from_clear(),
    to(), to_clear(), translators(), translators_clear()

=head1 METHODS

=over 4



=item init

Instructs L<Lingua::Translate> to use the C<Babelfish> backend.

=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<textpipetranslate> tag.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<<bug-text-pipe-translate@rt.cpan.org>>, or through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHOR

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

