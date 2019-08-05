# Nucleotide Count

Given a single stranded DNA string, compute how many times each nucleotide occurs in the string.

The genetic language of every living thing on the planet is DNA.
DNA is a large molecule that is built from an extremely long sequence of individual elements called nucleotides.
4 types exist in DNA and these differ only slightly and can be represented as the following symbols: 'A' for adenine, 'C' for cytosine, 'G' for guanine, and 'T' thymine.

Here is an analogy:
- twigs are to birds nests as
- nucleotides are to DNA as
- legos are to lego houses as
- words are to sentences as...

## Running tests

Execute the tests with:

```bash
$ mix test
```

### Pending tests

In the test suites, all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by
commenting out the relevant `@tag :pending` with a `#` symbol.

For example:

```elixir
# @tag :pending
test "shouting" do
  assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
end
```

Or, you can enable all the tests by commenting out the
`ExUnit.configure` line in the test suite.

```elixir
# ExUnit.configure exclude: :pending, trace: true
```

If you're stuck on something, it may help to look at some of
the [available resources](https://exercism.io/tracks/elixir/resources)
out there where answers might be found.

## Source

The Calculating DNA Nucleotides_problem at Rosalind [http://rosalind.info/problems/dna/](http://rosalind.info/problems/dna/)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
