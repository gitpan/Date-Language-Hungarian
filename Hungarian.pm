##
## Hungarian tables based on English
##
#
# This is a just-because-I-stumbled-across-it
# -and-my-wife-is-Hungarian release: if Graham or
# someone adds to docs to Date::Format, I'd be
# glad to correct bugs and extend as neeed.
#

package Date::Language::Hungarian;

use Strict;
use warnings;
use Date::Language ();
use vars qw(@ISA @DoW @DoWs @MoY @MoYs @AMPM @Dsuf %MoY %DoW $VERSION);
@ISA = qw(Date::Language);
$VERSION = "0.01";

@DoW = qw(Vasárnap Hétfõ Kedd Szerda Csütörtök Péntek Szombat);
@MoY = qw(Január Február Marcius Április Május Június
	  Július Augusztus Szeptember Oktober November December);
@DoWs = map { substr($_,0,3) } @DoW;
@MoYs = map { substr($_,0,3) } @MoY;
@AMPM = qw(de. du.);

@Dsuf = "." x 31;	# There is no 'th or 'nd in Hungarian, just a dot

@MoY{@MoY}  = (0 .. scalar(@MoY));
@MoY{@MoYs} = (0 .. scalar(@MoYs));
@DoW{@DoW}  = (0 .. scalar(@DoW));
@DoW{@DoWs} = (0 .. scalar(@DoWs));

# Formatting routines

sub format_a { $DoWs[$_[0]->[6]] }
sub format_A { $DoW[$_[0]->[6]] }
sub format_b { $MoYs[$_[0]->[4]] }
sub format_B { $MoY[$_[0]->[4]] }
sub format_h { $MoYs[$_[0]->[4]] }
sub format_p { $_[0]->[2] >= 12 ?  $AMPM[1] : $AMPM[0] }

1;
