# Design

A bunch of tests for "unopened accounts", "opening the same account twice", or "reopening" are skipped because they don't make sense for Elixir processes. You cannot reference a process that wasn't started, and you cannot start the same process twice, and you cannot restart a stopped process without (only replace it with a new process).
