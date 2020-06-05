## Learning objectives

- Know of the access _behaviour_ (Note the UK spelling.)
- Know that the access behaviour can be used on maps and keyword lists
- Know the syntax for the access behaviour
- limitations of the access behaviour
  - doesn't work for structs, unless the behaviour is implemented in the defining module
  - doesn't raise errors in some circumstances

## Out of scope

- structs
- static access operator (e.g. map.key to obtain value)

## Concepts

- `access-behaviour`

## Prerequisites

- `maps`
- `strings`
- `recursion`
- `nil`

## Narrative for exercise

Follows the **Basketball Website Story** (outlined [here](https://github.com/exercism/v3/blob/master/reference/stories/deep-dig.basketball-team-website.md))

## Resources to refer to

- [access-behaviour](https://hexdocs.pm/elixir/Access.html)

## Representer

- TBD

## Analyzer

- That `structs` aren't used.
- That the `static access operator` isn't used.
- That `Map` module functions aren't used.
- That for `extract_from_path/2` get_in isn't used, but that access behavior is used
- That for `get_in_path/2` get_in is used
