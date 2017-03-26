defmodule ScaleGenerator do
  @chromatic_scale ~w(C C# D D# E F F# G G# A A# B)
  @flat_chromatic_scale ~w(C Db D Eb E F Gb G Ab A Bb B)
  @flat_keys ~w(F Bb Eb Ab Db Gb d g c f bb eb)

  @doc """
  The chromatic scale is a musical scale with twelve pitches, each a semitone
  (half-tone) above or below another.

  Notes with a sharp (#) are a semitone higher than the note below them, where
  the next letter note is a full tone except in the case of B and E, which have
  no sharps.

  Generate these 12 notes, starting with the given `tonic` and wrapping back
  around to the note before it. If the `tonic` is lowercase, capitalize it.

  "C" should generate: ~w(C C# D D# E F F# G G# A A# B)
  """
  @spec chromatic_scale(tonic :: String.t()) :: list(String.t())
  def chromatic_scale(tonic \\ "C") do
    tonic
    |> String.capitalize
    |> rotate_scale(@chromatic_scale)
  end

  @doc """
  Sharp notes can also be considered the flat (b) note of the tone above them,
  so the 12 notes can also be represented as:

  A Bb B C Db D Eb E F Gb G Ab

  Generate these 12 notes, starting with the given `tonic` and wrapping back
  around to the note before it. If the `tonic` is lowercase, capitalize it.

  "C" should generate: ~w(C Db D Eb E F Gb G Ab A Bb B)
  """
  @spec flat_chromatic_scale(tonic :: String.t()) :: list(String.t())
  def flat_chromatic_scale(tonic \\ "C") do
    tonic
    |> String.capitalize
    |> rotate_scale(@flat_chromatic_scale)
  end

  defp rotate_scale(tonic, scale, temp \\ [])
  defp rotate_scale(tonic, [tonic | _] = scale_from_tonic, temp), do: scale_from_tonic ++ temp
  defp rotate_scale(tonic, [head | tail], temp), do: rotate_scale(tonic, tail, temp ++ [head])

  @doc """
  Certain scales will require the use of the flat version, depending on the
  `tonic` (key) that begins them, which is C in the above examples.

  For any of the following tonics, use the flat chromatic scale:

  F Bb Eb Ab Db Gb d g c f bb eb

  For all others, use the regular chromatic scale.
  """
  @spec find_chromatic_scale(tonic :: String.t()) :: list(String.t())
  for flat_tonic <- @flat_keys do
    def find_chromatic_scale(unquote(flat_tonic)), do: flat_chromatic_scale(unquote(flat_tonic |> String.capitalize))
  end
  def find_chromatic_scale(tonic) do
    chromatic_scale(tonic)
  end

  @doc """
  Find the note a given interval (`step`) in `scale` after the `tonic`.

  "m": one semitone
  "M": two semitones (full tone)
  "A": augmented second (three semitones)
  """
  @spec step(scale :: list(String.t()), tonic :: String.t(), step :: String.t()) :: list(String.t())
  def step(scale, tonic, step) do
    tonic |> rotate_scale(scale) |> do_step(step)
  end

  defp do_step([_tonic, semitone, _full_tone | _], "m"), do: semitone
  defp do_step([_tonic, _semitone, full_tone | _], "M"), do: full_tone
  defp do_step([_tonic, _semitone, _full_tone, accidental | _], "A"), do: accidental

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
    |> generate_scale(pattern, [tonic |> String.capitalize])
  end

  defp generate_scale(scale, pattern, results)
  defp generate_scale(_scale, "", results), do: Enum.reverse(results)
  defp generate_scale(scale, <<step_amt::binary-size(1), pattern::binary>>, [last_tonic | _] = results) do
    generate_scale(scale, pattern, [step(scale, last_tonic, step_amt) | results])
  end
end

