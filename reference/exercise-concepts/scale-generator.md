# Concepts for scale-generator

A note about the exercise: as one with a graduate degree in Music Theory and Composition, this one drove me nuts. The way it approached steps and tonality was at a minimum, not standard. Specifically, I think the explanation and solution could be simplified if it addressed the issue of enharmonic equivalence (e.g. C# == Db) and/or used numbers representing scale degrees instead of semitones, or did some combination of both.

For example, the `step/3` function really was only dealing with chromatic scales, so as such, there is no notion of "tonic" (in my solution, that argument was ignored entirely). Perhaps the cleanest refactor of that would be to rename the `tonic` argument as `starting_pitch` (since there is no notion of "tonic" when dealing with chromatic scales) and rename the function as `chromatic_step/3`.

Another odd implementation in the exercise was that it represented scales as having 13 (!!!) tones, e.g. `~w(A A# B C C# D D# E F F# G G# A)` -- this is highly unusual, and it actually violates the set principles on which music is based (both tonal and atonal). More appropriate (and standard in the literature), would be to reference the octave equivalence using an apostrophe, e.g. `A'` (i.e. A prime), e.g. `~w(A A# B C C# D D# E F F# G G# A')`, but for these exercises, it would be far better to normalize the pitch sets and skip the octave equivalence entirely, i.e. `~w(A A# B C C# D D# E F F# G G#)` (12 tones for the Western chromatic scale) and `~w(C D E F G A B)` (7 tones for all Western modal scales).

As I ref'd in my comments: "NOTE: we are manually tacking tonic back on to the end of the scale to meet the "business requirements" of the exercise. Normally, I would not double-list pitches in a scale."

```elixir
@spec chromatic_scale(tonic :: String.t()) :: list(String.t())
  def chromatic_scale(tonic), do: transpose(@chromatic_scale, String.capitalize(tonic)) ++ [String.capitalize(tonic)]
```

The `++` here is weird conceptually given the problem space and arguably it's weird in the language (I think we can find a better place to teach the `++` operator).

## Approach:

### Enum.slice

Here is my (somewhat tortured) solution (esp. the `accumulate_scale` function is not great):

```elixir
defmodule ScaleGenerator do

  # Note: these use only 12 tones so that they can remain cyclical
  # (whereas the "business logic" described in the instructions refers to scales with 13 pitches).
  @chromatic_scale ~w(C C# D D# E F F# G G# A A# B)
  @flat_chromatic_scale ~w(C Db D Eb E F Gb G Ab A Bb B)

  # Lowercase denotes minor keys
  defguard is_flat_key(tonic) when tonic in ~w(F Bb Eb Ab Db Gb Cb d g c f bb eb ab)

  @doc """
  Find the note for a given interval (`step`) in a `scale` after the `tonic`.

  "m": one semitone
  "M": two semitones (full tone)
  "A": augmented second (three semitones)

  Given the `tonic` "D" in the `scale` (C C# D D# E F F# G G# A A# B C), you
  should return the following notes for the given `step`:

  "m": D#
  "M": E
  "A": F

  NOTE: we don't really need to know the tonic to figure out the next step... if I were writing
  the function signatures, I would omit the "tonic" argument entirely.
  """
  @spec step(scale :: list(String.t()), tonic :: String.t(), step :: String.t()) ::
          list(String.t())
  def step(scale, _tonic, "m"), do: Enum.at(scale, 1)
  def step(scale, _tonic, "M"), do: Enum.at(scale, 2)
  def step(scale, _tonic, "A"), do: Enum.at(scale, 3)

  # Convert the given scale so it starts at the given tonic
  defp transpose(scale, tonic) do
    index = Enum.find_index(scale, fn x -> x == tonic end)
    start = Enum.slice(scale, index, 12)
    remainder = Enum.slice(scale, 0, index)
    start ++ remainder
  end

  @doc """
  The chromatic scale is a musical scale with thirteen pitches, each a semitone
  (half-tone) above or below another.

  Notes with a sharp (#) are a semitone higher than the note below them, where
  the next letter note is a full tone except in the case of B and E, which have
  no sharps.

  Generate these notes, starting with the given `tonic` and wrapping back
  around to the note before it, ending with the tonic an octave higher than the
  original. If the `tonic` is lowercase, capitalize it.

  "C" should generate: ~w(C C# D D# E F F# G G# A A# B C)

  NOTE: we are manually tacking tonic back on to the end of the scale to meet the "business requirements" of
  the exercise.  Normally, I would not double-list pitches in a scale.
  """
  @spec chromatic_scale(tonic :: String.t()) :: list(String.t())
  def chromatic_scale(tonic), do: transpose(@chromatic_scale, String.capitalize(tonic)) ++ [String.capitalize(tonic)]


  @doc """
  Enharmonic equivalents: sharp notes can also be considered the flat (b) note of the tone above them,
  e.g. G# ~ Ab, D# ~ Eb, etc.

  So the notes of a chromatic scale can be represented using flats as:

  A Bb B C Db D Eb E F Gb G Ab

  Generate these notes, starting with the given `tonic` and wrapping back
  around to the note before it, ending with the tonic an octave higher than the
  original. If the `tonic` is lowercase, capitalize it.

  "C" should generate: ~w(C Db D Eb E F Gb G Ab A Bb B C)
  """
  @spec flat_chromatic_scale(tonic :: String.t()) :: list(String.t())
  def flat_chromatic_scale(tonic),
      do: transpose(@flat_chromatic_scale, String.capitalize(tonic)) ++ [String.capitalize(tonic)]

  @doc """
  Certain scales will require the use of the flat version, depending on the
  `tonic` (key) that begins them, which is C in the above examples.

  For any of the following tonics, use the flat chromatic scale:

  F Bb Eb Ab Db Gb d g c f bb eb

  For all others, use the regular chromatic scale.
  """
  @spec find_chromatic_scale(tonic :: String.t()) :: list(String.t())
  def find_chromatic_scale(tonic) when is_flat_key(tonic), do: flat_chromatic_scale(tonic)
  def find_chromatic_scale(tonic), do: chromatic_scale(tonic)

  @doc """
  The `pattern` string will identify the steps between the notes in the scale.

  For example, the pattern "MMmMMMm" starting on tonic C indicates a C Major scale.
  You will start with C, make a whole-step (a major 2nd, or "M") up to D, another whole-step ("M") up
  to E, then a semitone (a minor 2nd, or "m") to F, and so on to get all the notes of the major scale:

  C D E F G A B C
  """
  @spec scale(tonic :: String.t(), pattern :: String.t()) :: list(String.t())
  def scale(tonic, pattern) when is_flat_key(tonic) do
    tonic = String.capitalize(tonic)
    accumulate_scale(transpose(@flat_chromatic_scale, tonic), tonic, pattern)
  end
  def scale(tonic, pattern) do
    tonic = String.capitalize(tonic)
    accumulate_scale(transpose(@chromatic_scale, tonic), tonic, pattern)
  end

  # This enumerates over the pattern (converted to a list).  It keeps a map accumulator so it can track
  # both the accumulating scale AND the transposed chromatic scale.
  # The transposed chromatic scale is only scaffolding and ultimately only the accumulated scale is returned.
  # TODO: use a tuple accumulator instead of a map
  defp accumulate_scale(chromatic_scale, tonic, pattern) do
    acc = Enum.reduce(
      String.codepoints(pattern),
      %{scale_acc: [tonic], chromatic: chromatic_scale},
      fn x, acc ->
        next_note = step(acc.chromatic, "", x)
        %{
          scale_acc: acc.scale_acc ++ [next_note],
          chromatic: transpose(acc.chromatic, next_note)
        }
      end
    )
    acc.scale_acc
  end

end

```

## Concepts:

Arguably, this one really can/should be all about `Enum.slice` and `Enum.find_index`...

- naming
- modules
- module attributes
  - @doc
    - documentation
  - @spec
    - types
    - String.t()
    - list(String.t())
    - dialyxir
- dynamic typing
- standard library modules
  - Kernel
    - in/2
    - `++`
  - String
    - codepoints/1 (alternatively: `<<h::binary>>` style matching)
  - Enum
    - Enum.slice
    - Enum.find_index
    - Enum.reduce
- guards
  - when
  - custom implementations using `defguard`
- types
  - String.t
  - lists
  - maps
