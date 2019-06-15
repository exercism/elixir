defmodule ScaleGeneratorTest do
  use ExUnit.Case

  @major_scale_pattern "MMmMMMm"
  @minor_scale_pattern "MmMMmMM"
  @dorian_scale_pattern "MmMMMmM"
  @mixolydian_scale_pattern "MMmMMmM"
  @lydian_scale_pattern "MMMmMMm"
  @phrygian_scale_pattern "mMMMmMM"
  @locrian_scale_pattern "mMMmMMM"
  @harmonic_minor_scale_pattern "MmMMmAm"
  @melodic_minor_scale_pattern "MmMMMMm"
  @octatonic_scale_pattern "MmMmMmMm"
  @hexatonic_scale_pattern "MMMMMM"
  @pentatonic_scale_pattern "MMAMA"
  @enigmatic_scale_pattern "mAMMMmm"

  describe "step to next note" do
    # @tag :pending
    test "with half-tone interval" do
      assert ScaleGenerator.step(~w(C C# D D# E F F# G G# A A# B), "C", "m") == "C#"
    end

    @tag :pending
    test "with full tone interval" do
      assert ScaleGenerator.step(~w(C C# D D# E F F# G G# A A# B), "C", "M") == "D"
    end

    @tag :pending
    test "with accidental interval" do
      assert ScaleGenerator.step(~w(C C# D D# E F F# G G# A A# B), "C", "A") == "D#"
    end
  end

  describe "generate chromatic scale" do
    @tag :pending
    test "starting with A" do
      assert ScaleGenerator.chromatic_scale("A") == ~w(A A# B C C# D D# E F F# G G# A)
    end

    @tag :pending
    test "starting with C" do
      assert ScaleGenerator.chromatic_scale("C") == ~w(C C# D D# E F F# G G# A A# B C)
    end

    @tag :pending
    test "starting with G" do
      assert ScaleGenerator.chromatic_scale("G") == ~w(G G# A A# B C C# D D# E F F# G)
    end

    @tag :pending
    test "works with with lowercase notes" do
      assert ScaleGenerator.chromatic_scale("f#") == ~w(F# G G# A A# B C C# D D# E F F#)
    end
  end

  describe "generate flat chromatic scale" do
    @tag :pending
    test "starting with A" do
      assert ScaleGenerator.flat_chromatic_scale("A") == ~w(A Bb B C Db D Eb E F Gb G Ab A)
    end

    @tag :pending
    test "starting with C" do
      assert ScaleGenerator.flat_chromatic_scale("C") == ~w(C Db D Eb E F Gb G Ab A Bb B C)
    end

    @tag :pending
    test "starting with G" do
      assert ScaleGenerator.flat_chromatic_scale("G") == ~w(G Ab A Bb B C Db D Eb E F Gb G)
    end

    @tag :pending
    test "works with with lowercase notes" do
      assert ScaleGenerator.flat_chromatic_scale("Gb") == ~w(Gb G Ab A Bb B C Db D Eb E F Gb)
    end
  end

  describe "find chromatic scale for flat tonics" do
    @tag :pending
    test "using F" do
      assert ScaleGenerator.find_chromatic_scale("F") == ~w(F Gb G Ab A Bb B C Db D Eb E F)
    end

    @tag :pending
    test "using Bb" do
      assert ScaleGenerator.find_chromatic_scale("Bb") == ~w(Bb B C Db D Eb E F Gb G Ab A Bb)
    end

    @tag :pending
    test "using Eb" do
      assert ScaleGenerator.find_chromatic_scale("Eb") == ~w(Eb E F Gb G Ab A Bb B C Db D Eb)
    end

    @tag :pending
    test "using Ab" do
      assert ScaleGenerator.find_chromatic_scale("Ab") == ~w(Ab A Bb B C Db D Eb E F Gb G Ab)
    end

    @tag :pending
    test "using Db" do
      assert ScaleGenerator.find_chromatic_scale("Db") == ~w(Db D Eb E F Gb G Ab A Bb B C Db)
    end

    @tag :pending
    test "using Gb" do
      assert ScaleGenerator.find_chromatic_scale("Gb") == ~w(Gb G Ab A Bb B C Db D Eb E F Gb)
    end

    @tag :pending
    test "using d" do
      assert ScaleGenerator.find_chromatic_scale("d") == ~w(D Eb E F Gb G Ab A Bb B C Db D)
    end

    @tag :pending
    test "using g" do
      assert ScaleGenerator.find_chromatic_scale("g") == ~w(G Ab A Bb B C Db D Eb E F Gb  G)
    end

    @tag :pending
    test "using c" do
      assert ScaleGenerator.find_chromatic_scale("c") == ~w(C Db D Eb E F Gb G Ab A Bb B  C)
    end

    @tag :pending
    test "using f" do
      assert ScaleGenerator.find_chromatic_scale("f") == ~w(F Gb G Ab A Bb B C Db D Eb E F)
    end

    @tag :pending
    test "using bb" do
      assert ScaleGenerator.find_chromatic_scale("bb") == ~w(Bb B C Db D Eb E F Gb G Ab A Bb)
    end

    @tag :pending
    test "using eb" do
      assert ScaleGenerator.find_chromatic_scale("eb") == ~w(Eb E F Gb G Ab A Bb B C Db D Eb)
    end
  end

  describe "find chromatic scale for non-flat tonics" do
    @tag :pending
    test "using A" do
      assert ScaleGenerator.find_chromatic_scale("A") == ~w(A A# B C C# D D# E F F# G G# A)
    end

    @tag :pending
    test "using A#" do
      assert ScaleGenerator.find_chromatic_scale("A#") == ~w(A# B C C# D D# E F F# G G# A A#)
    end

    @tag :pending
    test "using B" do
      assert ScaleGenerator.find_chromatic_scale("B") == ~w(B C C# D D# E F F# G G# A A# B)
    end

    @tag :pending
    test "using C" do
      assert ScaleGenerator.find_chromatic_scale("C") == ~w(C C# D D# E F F# G G# A A# B C)
    end

    @tag :pending
    test "using C#" do
      assert ScaleGenerator.find_chromatic_scale("C#") == ~w(C# D D# E F F# G G# A A# B C C#)
    end

    @tag :pending
    test "using D" do
      assert ScaleGenerator.find_chromatic_scale("D") == ~w(D D# E F F# G G# A A# B C C# D)
    end

    @tag :pending
    test "using D#" do
      assert ScaleGenerator.find_chromatic_scale("D#") == ~w(D# E F F# G G# A A# B C C# D D#)
    end

    @tag :pending
    test "using E" do
      assert ScaleGenerator.find_chromatic_scale("E") == ~w(E F F# G G# A A# B C C# D D# E)
    end

    @tag :pending
    test "using F#" do
      assert ScaleGenerator.find_chromatic_scale("F#") == ~w(F# G G# A A# B C C# D D# E F F#)
    end

    @tag :pending
    test "using G" do
      assert ScaleGenerator.find_chromatic_scale("G") == ~w(G G# A A# B C C# D D# E F F# G)
    end

    @tag :pending
    test "using G#" do
      assert ScaleGenerator.find_chromatic_scale("G#") == ~w(G# A A# B C C# D D# E F F# G G#)
    end
  end

  describe "generate scale from tonic and pattern" do
    @tag :pending
    test "C Major scale" do
      assert ScaleGenerator.scale("C", @major_scale_pattern) == ~w(C D E F G A B C)
    end

    @tag :pending
    test "G Major scale" do
      assert ScaleGenerator.scale("G", @major_scale_pattern) == ~w(G A B C D E F# G)
    end

    @tag :pending
    test "f# minor scale" do
      assert ScaleGenerator.scale("f#", @minor_scale_pattern) == ~w(F# G# A B C# D E F#)
    end

    @tag :pending
    test "b flat minor scale" do
      assert ScaleGenerator.scale("bb", @minor_scale_pattern) == ~w(Bb C Db Eb F Gb Ab Bb)
    end

    @tag :pending
    test "D Dorian scale" do
      assert ScaleGenerator.scale("d", @dorian_scale_pattern) == ~w(D E F G A B C D)
    end

    @tag :pending
    test "E flat Mixolydian scale" do
      assert ScaleGenerator.scale("Eb", @mixolydian_scale_pattern) == ~w(Eb F G Ab Bb C Db Eb)
    end

    @tag :pending
    test "a Lydian scale" do
      assert ScaleGenerator.scale("a", @lydian_scale_pattern) == ~w(A B C# D# E F# G# A)
    end

    @tag :pending
    test "e Phrygian scale" do
      assert ScaleGenerator.scale("e", @phrygian_scale_pattern) == ~w(E F G A B C D E)
    end

    @tag :pending
    test "g Locrian scale" do
      assert ScaleGenerator.scale("g", @locrian_scale_pattern) == ~w(G Ab Bb C Db Eb F G)
    end

    @tag :pending
    test "d Harmonic minor scale" do
      assert ScaleGenerator.scale("d", @harmonic_minor_scale_pattern) == ~w(D E F G A Bb Db D)
    end

    @tag :pending
    test "C Melodic minor scale" do
      assert ScaleGenerator.scale("C", @melodic_minor_scale_pattern) == ~w(C D D# F G A B C)
    end

    @tag :pending
    test "C Octatonic scale" do
      assert ScaleGenerator.scale("C", @octatonic_scale_pattern) == ~w(C D D# F F# G# A B C)
    end

    @tag :pending
    test "D flat Hexatonic scale" do
      assert ScaleGenerator.scale("Db", @hexatonic_scale_pattern) == ~w(Db Eb F G A B Db)
    end

    @tag :pending
    test "A Pentatonic scale" do
      assert ScaleGenerator.scale("A", @pentatonic_scale_pattern) == ~w(A B C# E F# A)
    end

    @tag :pending
    test "G Enigmatic scale" do
      assert ScaleGenerator.scale("G", @enigmatic_scale_pattern) == ~w(G G# B C# D# F F# G)
    end
  end
end
