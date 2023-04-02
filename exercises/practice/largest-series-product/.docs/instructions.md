# Instructions

Given a string of digits, calculate the largest product for a contiguous substring of digits of length n.

For example, for the input `"1027839564"`, the largest product for a series of 3 digits is 270 `(9 * 5 * 6)`, and the largest product for a series of 5 digits is 7560 `(7 * 8 * 3 * 9 * 5)`.

Note that these series are only required to occupy _adjacent positions_ in the input; the digits need not be _numerically consecutive_.

For the input `"73167176531330624919225119674426574742355349194934"`,
the largest product for a series of 6 digits is 23520.

For a series of zero digits, you need to return the empty product (the result of multiplying no numbers), which is 1.

~~~~exercism/advanced
You do not need to understand why the empty product is 1 to solve this problem,
but in case you are interested, here is an informal argument: if we split a list of numbers `A` into two new lists `B` and `C`, then we expect `product(A) == product(B) * product(C)` because we don't expect the order that you multiply things to matter; now if we split a list containing only the number 3 into the empty list and a list containing the number 3 then the product of the empty list has to be 1 for `product([3]) == product([]) * product([3])` to be true.

The same kind of argument justifies why the sum of no numbers is 0.
~~~~
