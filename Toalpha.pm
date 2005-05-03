package Text::Toalpha;

use 5.008001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(toalpha fromalpha) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw();

our $VERSION = '0.01';

my @table = ( 'aa' .. 'zz' );
my %out_table;

# Build %out_table.  
for (my $i = 0; $i != @table; ++$i) {
	$out_table{$table[$i]} = chr($i);
}

sub toalpha {
	my $in = shift;
	my $out = $in;
	$out =~ s/(.)/$table[ord($1)]/g;
	return $out;
}

sub fromalpha {
	my $in = shift;
	my $out = $in;
	$out =~ s/(..)/$out_table{$1}/g;
	return $out;
}

1;
__END__

=head1 NAME

Text::Toalpha - Convert arbitary characters into letters

=head1 SYNOPSIS

  use Text::Toalpha qw(:all);
  my $alpha = toalpha($var);
  my $orig = fromalpha($alpha);

=head1 DESCRIPTION

B<Text::Toalpha> converts arbitary characters into letters.  The interface
is the functions B<toalpha($var)> and B<fromalpha($alpha)>.  They do what
there names suggest.  

=head1 INTERNALS

B<Text::Toalpha> uses a mapping table from characters to letters which maps
them into digrams.  Need more be said?  

=head1 CAVEATS

The resulting output will double in size.  

The permutation of characters to letters is not very well permutated.  

=head1 SEE ALSO

L<isalpha>

=head1 AUTHOR

Samuel Lauber, E<lt>samuell@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2005 by Samuel Lauber

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
