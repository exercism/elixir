# Instructions

[Paint by number][paint-by-number] (also known as _color by number_)
are black-and-white pictures meant for coloring.
The different areas of the picture are annotated with different numbers,
the numbers correspond to specific colors in a predefined color palette.
The goal is to fill the areas with the right colors,
revealing a beautiful colorful picture at the end.
It's a relaxing activity for both kids and adults.

You have been tasked with writing a paint-by-number app in Elixir.
You want your app to be able to import and export pictures in a custom data format.
You have decided to use [binary files][binary-file] to store your picture data.

~~~~exercism/note
This exercise assumes that you're familiar with [binary numbers](https://en.wikipedia.org/wiki/Binary_number)
and understand the principles behind changing binary numbers to decimal numbers
and decimal numbers to binary numbers. 
~~~~

Let's imagine you have a picture of a heart, like the one represented by ASCII art below.
The picture has a white background. The heart has a black border and a red fill color.

```
    * * *       * * *    
  * . . . *   * . . . *  
* . . . . . * . . . . . *
* . . . . . . . . . . . *
* . . . . . . . . . . . *
* . . . . . . . . . . . *
  * . . . . . . . . . *  
    * . . . . . . . *    
      * . . . . . *      
        * . . . *        
          * . *          
            *            
```

This picture uses 3 colors.
Let's say we assign indices to those colors:
- `0` (binary: `0b00`) for white,
- `1` (binary: `0b01`) for black`,
- `2` (binary: `0b10`) for red.

We can now use those color indices to represent the color of each pixel.

```
0 0 1 1 1 0 0 0 1 1 1 0 0
0 1 2 2 2 1 0 1 2 2 2 1 0
1 2 2 2 2 2 1 2 2 2 2 2 1
1 2 2 2 2 2 2 2 2 2 2 2 1
1 2 2 2 2 2 2 2 2 2 2 2 1
1 2 2 2 2 2 2 2 2 2 2 2 1
0 1 2 2 2 2 2 2 2 2 2 1 0
0 0 1 2 2 2 2 2 2 2 1 0 0
0 0 0 1 2 2 2 2 2 1 0 0 0
0 0 0 0 1 2 2 2 1 0 0 0 0
0 0 0 0 0 1 2 1 0 0 0 0 0
0 0 0 0 0 0 1 0 0 0 0 0 0
```

The same data represented in binary numbers, in 2-bit segments, would look like this:

```
00 00 01 01 01 00 00 00 01 01 01 00 00
00 01 10 10 10 01 00 01 10 10 10 01 00
01 10 10 10 10 10 01 10 10 10 10 10 01
01 10 10 10 10 10 10 10 10 10 10 10 01
01 10 10 10 10 10 10 10 10 10 10 10 01
01 10 10 10 10 10 10 10 10 10 10 10 01
00 01 10 10 10 10 10 10 10 10 10 01 00
00 00 01 10 10 10 10 10 10 10 01 00 00
00 00 00 01 10 10 10 10 10 01 00 00 00
00 00 00 00 01 10 10 10 01 00 00 00 00
00 00 00 00 00 01 10 01 00 00 00 00 00
00 00 00 00 00 00 01 00 00 00 00 00 00
```

## 1. Calculate palette bit size

Calculate how many bits are necessary to represent the given number of colors.

For example, representing 13 different colors require 4 bits. 4 bits can store up to 16 colors (2^4). 3 bits would not be enough because 3 bits can only store up to 8 colors (2^3).

```elixir
PaintByNumber.palette_bit_size(13)
# => 4
```

Note: there is no `log2` function in the Elixir standard library (you will later learn how to use [Erlang libraries][erlang-libraries] from Elixir where you can find this function). Solve this task with recursion and the [`Integer.pow/2`][integer-pow] function instead. If you're solving this exercise on your own computer using an older Elixir version (1.11 or lower) that doesn't have `Integer.pow/2` function, use the `Math.pow/2` function we provided in the `lib/math.ex` file for this exercise.


[paint-by-number]: https://en.wikipedia.org/wiki/Paint_by_number
[binary-file]: https://en.wikipedia.org/wiki/Binary_file
[erlang-libraries]: https://exercism.org/tracks/elixir/concepts/erlang-libraries
[integer-pow]: https://hexdocs.pm/elixir/Integer.html#pow/2
