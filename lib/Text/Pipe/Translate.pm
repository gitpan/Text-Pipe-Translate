package Text::Pipe::Translate;

use strict;
use warnings;
use Lingua::Translate;


our $VERSION = '0.02';


use base qw(Text::Pipe::Base);


__PACKAGE__->mk_scalar_accessors(qw(from to translators));


use constant DEFAULTS => (
    translators => {},
);


sub get_translator {
    my $self = shift;
    $self->translators->{ $self->from }{ $self->to } ||=
        Lingua::Translate->new(src => $self->from, dest => $self->to);
}


sub filter_single {
    my ($self, $input) = @_;
    $self->get_translator->translate($input);
}


1;


__END__



=head1 NAME

Text::Pipe::Translate - Translate text from one language to another

=head1 SYNOPSIS

    use Text::Pipe 'pipe';
    my $pipe = pipe 'Translate::Babelfish', from => 'en', to => 'de';
    my $german = $pipe->filter('My hovercraft is full of eels.'),

=head1 DESCRIPTION

This pipe segment can translate text from one language to another. To do so it
uses L<Lingua::Translate>.

Text::Pipe::Translate inherits from L<Text::Pipe::Base>.

=head1 METHODS

=over 4

=item clear_from

    $obj->clear_from;

Clears the value.

=item clear_to

    $obj->clear_to;

Clears the value.

=item clear_translators

    $obj->clear_translators;

Clears the value.

=item from

    my $value = $obj->from;
    $obj->from($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item from_clear

    $obj->from_clear;

Clears the value.

=item to

    my $value = $obj->to;
    $obj->to($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item to_clear

    $obj->to_clear;

Clears the value.

=item translators

    my $value = $obj->translators;
    $obj->translators($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item translators_clear

    $obj->translators_clear;

Clears the value.

=item from

The source language, in RFC3066 form. See L<I18N::LangTags>. There is no
default.

=item to

The destination language, in RFC3066 form. See L<I18N::LangTags>. There is no
default.

=item get_translator

Constructs a translator object for the current settings of C<from()> and
C<to()> and caches it using the C<translators()> accessor.

=item filter_single

Takes a string and translates it according to the current settings of
C<from()> and C<to()>.


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

