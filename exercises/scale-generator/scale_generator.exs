defmodule ScaleGenerator do
  @doc """
  The chromatic scale is a musical scale with twelve pitches, each a semitone
  (half-tone) above or below another.

  C C# D D# E F F# G G# A A# B

  Notes with a sharp (#) are half a tone (a semitone) higher than the note
  below them, where the next letter note is a full tone except in the case of B
  and E, which have no sharps.

  Sharp notes can also be considered the flat (b) note of the tone above them,
  so the chromatic scale above can also be represented as:

  C Db D Eb E F Gb G Ab A Bb B

  Certain scales will require the use of the flat version, depending on the
  `tonic` (key) that begins them, which is C in the above examples.

  If you are asked to find a scale for any of the following tonics, use the
  flat chromatic scale:

  F Bb Eb Ab Db Gb d g c f bb eb

  For all others, use the regular chromatic scale.

  The `pattern` string will let you know how many semitones to step over to get
  the next note in your scale:

  "m": one semitone
  "M": two semitones (full tone)
  "A": augmented second (three semitones)

  For example, a C Major scale will receive the pattern "MMmMMMm", which
  indicates you will start with C, make a full step over C# to D, another over
  D# to E, then a semitone, stepping from E to F (again, E has no sharp). You
  can follow the rest of the pattern to get:

  C D E F G A B C

  For the purposes of these exercises, we don't repeat the tonic, so after you
  have found your 12 notes starting with your tonic, once you run out of notes,
  you can stop, leaving you with:

  C D E F G A B
  """
  @spec scale(tonic :: String.t(), pattern :: String.t()) :: list(String.t())
  def scale(tonic, pattern) do
  end
end

