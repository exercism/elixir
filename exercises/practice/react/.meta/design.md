# Design Decisions

## Strings as identifiers

We have decided to use strings rather than atoms to identify the cells. The reason is the one mentioned in the [Elixir Guide on GenServers](https://hexdocs.pm/elixir/genservers.html) about naming processes: atoms are not garbage collected and should not be generated from user input.

The cells in this exercise are not generated in such a way, but it seems like they would be in a production setting, every time the user would request more resources.

## Custom tests

As encouraged by the problem specifications, we have added tests using different types of value.
