## Learning objectives

- Know about the `File` module
- Know about the easy-to-use `File.read` and `File.write` functions
- Know about the more-detailed `File.open`, `File.close` and how to use the `IO` module together with those
- Know about some more common modes when opening a file, e.g. `:read`, `:write`, `:append`
- Know that opening a file starts a new process

## Out of scope

## Prerequisites

- `strings`
- `enum`
- `io`
- `processes`
- `pids`

## Concepts

- `file`

## Analyzer

- ensure that `log_sent_email/2`, `close_log/0`, and `send_newsletter/3` don't return `:ok` explicitly, but implicitly (from `File.close` etc.)
- ensure that `send_newsletter/3` calls `open_log/1` and `close_log/1` exactly once each, and doesn't use `File.write`.
