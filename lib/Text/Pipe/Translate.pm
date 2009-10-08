package Text::Pipe::Translate;
use 5.006;
use strict;
use warnings;
use Lingua::Translate;
our $VERSION = '0.05';
use base qw(Text::Pipe::Base);
__PACKAGE__->mk_scalar_accessors(qw(from to translators));
use constant DEFAULTS => (translators => {},);

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

    use Text::Pipe 'PIPE';
    my $pipe = PIPE 'Translate::Babelfish', from => 'en', to => 'de';
    my $german = $pipe->filter('My hovercraft is full of eels.'),

=head1 DESCRIPTION

This pipe segment can translate text from one language to another. To do so it
uses L<Lingua::Translate>.

Both source and destination language are to be given in RFC3066 form. See
L<I18N::LangTags>.

=head1 METHODS

=over 4

=item C<clear_from>

    $obj->clear_from;

Clears the value.

=item C<clear_to>

    $obj->clear_to;

Clears the value.

=item C<clear_translators>

    $obj->clear_translators;

Clears the value.

=item C<from>

    my $value = $obj->from;
    $obj->from($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item C<from_clear>

    $obj->from_clear;

Clears the value.

=item C<to>

    my $value = $obj->to;
    $obj->to($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item C<to_clear>

    $obj->to_clear;

Clears the value.

=item C<translators>

    my $value = $obj->translators;
    $obj->translators($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item C<translators_clear>

    $obj->translators_clear;

Clears the value.

=item C<get_translator>

Constructs a translator object for the current settings of C<from()> and
C<to()> and caches it using the C<translators()> accessor.

=item C<filter_single>

Takes a string and translates it according to the current settings of
C<from()> and C<to()>.

=back

Text::Pipe::Translate inherits from L<Text::Pipe::Base>.

The superclass L<Text::Pipe::Base> defines these methods and functions:

    new(), bit_or(), filter(), init()

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

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see L<http://search.cpan.org/dist/Text-Pipe-Translate/>.

=head1 AUTHORS

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007-2009 by the authors.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

