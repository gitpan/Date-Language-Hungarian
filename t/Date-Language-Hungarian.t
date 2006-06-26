use warnings;
use strict;
require POSIX;
use Test::More tests => 8;
use lib "../lib";
use_ok("Date::Format");
use_ok("Date::Language::Hungarian");
my $lang = Date::Language->new('Hungarian');
isa_ok($lang, 'Date::Language::Hungarian', 'lang');
ok($lang->time2str("%a %b %e %T %Y", time), 'parent pod');

# Calendar time for December 25, 1995, at 10:30 am.
my $time_t = POSIX::mktime( 0, 30, 10, 25, 11, 95 );
like( POSIX::ctime($time_t), qr 'Mon Dec 25 10:30:00 1995', 'POSIX');

like( $lang->time2str("%a %b %e %T %Y", $time_t), qr'Hét Dec 25 10:30:00 1995','magyar pod');

is( $lang->time2str("%o", $time_t), '25.', 'magyar date suffix');

is( $lang->time2str("%D", $time_t), '95.12.25', 'magyar date form yy/mm/dd');




__END__

            %%      PERCENT
            %a      day of the week abbr
            %A      day of the week
            %b      month abbr
            %B      month
            %c      MM/DD/YY HH:MM:SS
            %C      ctime format: Sat Nov 19 21:05:57 1994
            %d      numeric day of the month, with leading zeros (eg 01..31)
            %e      numeric day of the month, without leading zeros (eg 1..31)
            %D      MM/DD/YY
            %G      GPS week number (weeks since January 6, 1980)
            %h      month abbr
            %H      hour, 24 hour clock, leading 0's)
            %I      hour, 12 hour clock, leading 0's)
            %j      day of the year
            %k      hour
            %l      hour, 12 hour clock
            %L      month number, starting with 1
            %m      month number, starting with 01
            %M      minute, leading 0's
            %n      NEWLINE
            %o      ornate day of month -- "1st", "2nd", "25th", etc.
            %p      AM or PM
            %P      am or pm (Yes %p and %P are backwards :)
            %q      Quarter number, starting with 1
            %r      time format: 09:05:57 PM
            %R      time format: 21:05
            %s      seconds since the Epoch, UCT
            %S      seconds, leading 0's
            %t      TAB
            %T      time format: 21:05:57
            %U      week number, Sunday as first day of week
            %w      day of the week, numerically, Sunday == 0
            %W      week number, Monday as first day of week
            %x      date format: 11/19/94
            %X      time format: 21:05:57
            %y      year (2 digits)
            %Y      year (4 digits)
            %Z      timezone in ascii. eg: PST
            %z      timezone in format -/+0000


