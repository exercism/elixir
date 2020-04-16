# Concepts for rna-transcriptions:

## Approaches

### recursive / map

```elixir
defmodule RNATranscription do
  @rna_complements %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U,
  }

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(strand) do
    Enum.map strand, &(@rna_complements[&1])
  end
end
```

### tail recursion (ish?)

```elixir
defmodule RNATranscription do
  @nucleotides %{
    ?A => ?U,
    ?C => ?G,
    ?T => ?A,
    ?G => ?C
  }
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna([]), do: []
  def to_rna([nucleotide | dna]) do
    [@nucleotides[nucleotide] | to_rna(dna)]
  end
end
```

## List of concepts

The trickiest concept with this as written was due to it providing a _charlist_ instead of a regular string binary. The mapping / recursion / etc. is complex enough without throwing in the subtle difficulties of navigating character lists.

- approaches
  - map
  - tail recursion
- naming
- modules
  - module attributes
- named functions
  - one line syntax
  - multiline syntax
- types
  - list
  - char
  - codepoint
  - charlist
- standard library modules
  - Kernel
    - function capture
    - ? (codepoint)
  - Enum
    - map/2
- typespec
