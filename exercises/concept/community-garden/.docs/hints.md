# Hints

## General

- Read about the [`Agent` module][getting-started-agent] in the Getting Started guide.
- Read the documentation about the [`Agent` module][elixir-doc-agent].
- Watch [ElixirCasts: Introduction to Agents][elixircasts-agent].

## 1. Open the garden

- Review the [`Agent`][elixir-doc-agent] documentation.
- The function to initialize the state of the _agent process_ must return the initial state.

## 2. List the registrations

- The [`Agent`][elixir-doc-agent] module contains many functions to obtain the current state of the _agent process_.

## 3. Register plots to a person

- The [`Agent`][elixir-doc-agent] module contains functions to obtain and update the state of the _agent process_.
- The functions generally require a function which transforms the state and returns a specific form.
- In order to keep track of the id for the next plot to assign, your _agent process_'s state needs to keep track of the plots and also the next id to use for a plot.

## 4. Release plots

- The [`Agent`][elixir-doc-agent] module contains functions to obtain and update the state of the _agent process_.
- The functions generally require a function which transforms the state and returns the next state.

## 5. Get a registered plot

- The [`Agent`][elixir-doc-agent] module contains functions to obtain the state of the _agent process_.
- Obtain the plot from, then handle the result to return the correct result.

[elixircasts-agent]: https://elixircasts.io/intro-to-agents
[elixir-doc-agent]: https://hexdocs.pm/elixir/Agent.html
[getting-started-agent]: https://hexdocs.pm/elixir/agents.html
