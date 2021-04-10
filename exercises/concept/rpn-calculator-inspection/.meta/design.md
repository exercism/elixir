## Learning objectives

- the `Task` module

## Out of scope

- supervisors

## Concepts

- `tasks`
- `links`

## Prerequisites

- `processes`
- `pids`
- `enum`
- `errors`
- `maps`

## Analyzer

- Do not call `Process.link` after spawning the process, use `spawn_link` or `Task.start_link` instead
