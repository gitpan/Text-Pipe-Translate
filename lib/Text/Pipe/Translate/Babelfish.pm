package Text::Pipe::Translate::Babelfish;

use strict;
use warnings;
use LWP::UserAgent;


our $VERSION = '0.03';


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

=head1 METHODS

=over 4



=item init

Instructs L<Lingua::Translate> to use the C<Babelfish> backend.

=back

Text::Pipe::Translate::Babelfish inherits from L<Text::Pipe::Translate>.

The superclass L<Text::Pipe::Translate> defines these methods and
functions:

    clear_from(), clear_to(), clear_translators(), filter_single(), from(),
    from_clear(), get_translator(), to(), to_clear(), translators(),
    translators_clear()

The superclass L<Text::Pipe::Base> defines these methods and functions:

    new(), bit_or(), filter()

The superclass L<Class::Accessor::Complex> defines these methods and
functions:

    mk_abstract_accessors(), mk_array_accessors(), mk_boolean_accessors(),
    mk_class_array_accessors(), mk_class_hash_accessors(),
    mk_class_scalar_accessors(), mk_concat_accessors(),
    mk_forward_accessors(), mk_hash_accessors(), mk_integer_accessors(),
    mk_new(), mk_object_accessors(), mk_scalar_accessors(),
    mk_set_accessors(), mk_singleton()

The superclass L<Class::Accessor> defines these methods and functions:

    _carp(), _croak(), _mk_accessors(), accessor_name_for(),
    best_practice_accessor_name_for(), best_practice_mutator_name_for(),
    follow_best_practice(), get(), make_accessor(), make_ro_accessor(),
    make_wo_accessor(), mk_accessors(), mk_ro_accessors(),
    mk_wo_accessors(), mutator_name_for(), set()

The superclass L<Class::Accessor::Installer> defines these methods and
functions:

    install_accessor()

The superclass L<Class::Accessor::Constructor> defines these methods and
functions:

    _make_constructor(), mk_constructor(), mk_constructor_with_dirty(),
    mk_singleton_constructor()

The superclass L<Data::Inherited> defines these methods and functions:

    every_hash(), every_list(), flush_every_cache_by_key()

The superclass L<Class::Accessor::Constructor::Base> defines these methods
and functions:

    STORE(), clear_dirty(), clear_hygienic(), clear_unhygienic(),
    contains_hygienic(), contains_unhygienic(), delete_hygienic(),
    delete_unhygienic(), dirty(), dirty_clear(), dirty_set(),
    elements_hygienic(), elements_unhygienic(), hygienic(),
    hygienic_clear(), hygienic_contains(), hygienic_delete(),
    hygienic_elements(), hygienic_insert(), hygienic_is_empty(),
    hygienic_size(), insert_hygienic(), insert_unhygienic(),
    is_empty_hygienic(), is_empty_unhygienic(), set_dirty(),
    size_hygienic(), size_unhygienic(), unhygienic(), unhygienic_clear(),
    unhygienic_contains(), unhygienic_delete(), unhygienic_elements(),
    unhygienic_insert(), unhygienic_is_empty(), unhygienic_size()

The superclass L<Tie::StdHash> defines these methods and functions:

    CLEAR(), DELETE(), EXISTS(), FETCH(), FIRSTKEY(), NEXTKEY(), SCALAR(),
    TIEHASH()

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<textpipetranslate> tag.

=head1 VERSION 
                   
This document describes version 0.03 of L<Text::Pipe::Translate::Babelfish>.

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

Copyright 2007-2008 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

