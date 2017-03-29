use Bitwise (or div/rem)

If you use Bitwise, an easy way to see if a particular bit is set is to compare
the binary AND (`&&&`) of a set of bits with the particular bit pattern you
want to check, and determine if the result is the same as the pattern you're
checking.

Example:

Flags: 0b11011
Check: 0b11010

Flags &&& Check: 0b11010 (All checked bits are set)

Another:

Flags: 0b11011
Check: 0b10110

Flags &&& Check: 0b10010 (Third bit not set)
