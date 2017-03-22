if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("scale_generator.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule ScaleGeneratorTest do
  use ExUnit.Case

  @major_scale_pattern           "MMmMMMm"
  @minor_scale_pattern           "MmMMmMM"
  @dorian_scale_pattern          "MmMMMmM"
  @mixolydian_scale_pattern      "MMmMMmM"
  @lydian_scale_pattern          "MMMmMMm"
  @phrygian_scale_pattern        "mMMMmMM"
  @locrian_scale_pattern         "mMMmMMM"
  @harmonic_minor_scale_pattern  "MmMMmAm"
  @octatonic_scale_pattern       "MmMmMmMm"
  @hexatonic_scale_pattern       "MMMMMM"
  @pentatonic_scale_pattern      "MMAMA"
  @enigmatic_scale_pattern       "mAMMMmm"

  #@tag :pending
  test "C Major scale" do
    assert ScaleGenerator.scale("C", @major_scale_pattern) == ~w(C D E F G A B)
  end

  @tag :pending
  test "G Major scale" do
    assert ScaleGenerator.scale("G", @major_scale_pattern) == ~w(G A B C D E F#)
  end

  @tag :pending
  test "f# minor scale" do
    assert ScaleGenerator.scale("f#", @minor_scale_pattern) == ~w(F# G# A B C# D E)
  end

  @tag :pending
  test "b flat minor scale" do
    assert ScaleGenerator.scale("bb", @minor_scale_pattern) == ~w(Bb C Db Eb F Gb Ab)
  end

  @tag :pending
  test "D Dorian scale" do
    assert ScaleGenerator.scale("d", @dorian_scale_pattern) == ~w(D E F G A B C);
  end

  @tag :pending
  test "E flat Mixolydian scale" do
    assert ScaleGenerator.scale("Eb", @mixolydian_scale_pattern) == ~w(Eb F G Ab Bb C Db);
  end

  @tag :pending
  test "a Lydian scale" do
    assert ScaleGenerator.scale("a", @lydian_scale_pattern) == ~w(A B C# D# E F# G#);
  end

  @tag :pending
  test "e Phrygian scale" do
    assert ScaleGenerator.scale("e", @phrygian_scale_pattern) == ~w(E F G A B C D);
  end

  @tag :pending
  test "g Locrian scale" do
    assert ScaleGenerator.scale("g", @locrian_scale_pattern) == ~w(G Ab Bb C Db Eb F);
  end

  @tag :pending
  test "d Harmonic minor scale" do
    assert ScaleGenerator.scale("d", @harmonic_minor_scale_pattern) == ~w(D E F G A Bb Db);
  end

  @tag :pending
  test "C Octatonic scale" do
    assert ScaleGenerator.scale("C", @octatonic_scale_pattern) == ~w(C D D# F F# G# A B);
  end

  @tag :pending
  test "D flat Hexatonic scale" do
    assert ScaleGenerator.scale("Db", @hexatonic_scale_pattern) == ~w(Db Eb F G A B);
  end

  @tag :pending
  test "A Pentatonic scale" do
    assert ScaleGenerator.scale("A", @pentatonic_scale_pattern) == ~w(A B C# E F#);
  end

  @tag :pending
  test "G Enigmatic scale" do
    assert ScaleGenerator.scale("G", @enigmatic_scale_pattern) == ~w(G G# B C# D# F F#);
  end
end

