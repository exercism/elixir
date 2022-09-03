defmodule ScaleGenerator do
  @chromatic_scale ~w(C C# D D# E F F# G G# A A# B)
  @flat_chromatic_scale ~w(C Db D Eb E F Gb G Ab A Bb B)
  @flat_keys ~w(F Bb Eb Ab Db Gb d g c f bb eb)

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
  """
  @spec step(scale :: list(String.t()), tonic :: String.t(), step :: String.t()) :: String.t()
  def step(scale, tonic, step) do
    scale |> rotate_chromatic(tonic) |> do_step(step)
  end

  defp do_step([_tonic, semitone, _full_tone | _], "m"), do: semitone
  defp do_step([_tonic, _semitone, full_tone | _], "M"), do: full_tone
  defp do_step([_tonic, _semitone, _full_tone, accidental | _], "A"), do: accidental

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
  """
  @spec chromatic_scale(tonic :: String.t()) :: list(String.t())
  def chromatic_scale(tonic \\ "C") do
    rotate_chromatic(@chromatic_scale, tonic)
  end

  @doc """
  Sharp notes can also be considered the flat (b) note of the tone above them,
  so the notes can also be represented as:

  A Bb B C Db D Eb E F Gb G Ab

  Generate these notes, starting with the given `tonic` and wrapping back
  around to the note before it, ending with the tonic an octave higher than the
  original. If the `tonic` is lowercase, capitalize it.

  "C" should generate: ~w(C Db D Eb E F Gb G Ab A Bb B C)
  """
  @spec flat_chromatic_scale(tonic :: String.t()) :: list(String.t())
  def flat_chromatic_scale(tonic \\ "C") do
    rotate_chromatic(@flat_chromatic_scale, tonic)
  end

  defp rotate_chromatic(scale, tonic) do
    scale_length = length(scale)

    scale
    |> Stream.cycle()
    |> Enum.take(2 * scale_length)
    |> rotate_chromatic(tonic |> String.capitalize(), [])
    |> Enum.take(scale_length + 1)
  end

  defp rotate_chromatic([tonic | _] = scale_from_tonic, tonic, results),
    do: scale_from_tonic ++ results

  defp rotate_chromatic([head | tail], tonic, results),
    do: rotate_chromatic(tail, tonic, results ++ [head])

  @doc """
  Certain scales will require the use of the flat version, depending on the
  `tonic` (key) that begins them, which is C in the above examples.

  For any of the following tonics, use the flat chromatic scale:

  F Bb Eb Ab Db Gb d g c f bb eb

  For all others, use the regular chromatic scale.
  """
  @spec find_chromatic_scale(tonic :: String.t()) :: list(String.t())
  for flat_tonic <- @flat_keys do
    def find_chromatic_scale(unquote(flat_tonic)),
      do: flat_chromatic_scale(unquote(flat_tonic |> String.capitalize()))
  end

  def find_chromatic_scale(tonic) do
    chromatic_scale(tonic)
  end

  @doc """
  The `pattern` string will let you know how many steps to make for the next
  note in the scale.

  For example, a C Major scale will receive the pattern "MMmMMMm", which
  indicates you will start with C, make a full step over C# to D, another over
  D# to E, then a semitone, stepping from E to F (again, E has no sharp). You
  can follow the rest of the pattern to get:

  C D E F G A B C
  """
  @spec scale(tonic :: String.t(), pattern :: String.t()) :: list(String.t())
  def scale(tonic, pattern) do
    tonic
    |> find_chromatic_scale
    |> generate_scale(pattern, [tonic |> String.capitalize()])
  end

  defp generate_scale(scale, pattern, results)
  defp generate_scale(_scale, "", results), do: Enum.reverse(results)

  defp generate_scale(
         scale,
         <<step_amt::binary-size(1), pattern::binary>>,
         [last_tonic | _] = results
       ) do
    generate_scale(scale, pattern, [step(scale, last_tonic, step_amt) | results])
  end
end
