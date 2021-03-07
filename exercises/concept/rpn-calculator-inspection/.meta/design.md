## Learning objectives

- the `Task` module

## Out of scope

- supervisors

## Concepts

- `task`
- `links`

## Prerequisites

- `processes`
- `pids`
- `enum`
- `errors`


## Analyzer

- Do not call `Process.link` after spawning the process, use `spawn_link` or `Task.start_link` instead
