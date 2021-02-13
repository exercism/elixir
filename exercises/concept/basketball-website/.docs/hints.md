# Hints

## General

- Read about the [`Access` behaviour][access-behaviour] in the documentation.

## 1. Extract data from a nested map structure

- First tokenize the string path to a usable state. You can make use of [`String` module functions][string-module].
- Write a recursive function to traverse the nested-map structure to retrieve the value or return `nil`.

## 2. Refactor using included functions

- Read through the various [`Kernel` module functions][kernel-module], to find one that might shorten/simplify your approach.

[kernel-module]: https://hexdocs.pm/elixir/Kernel.html#functions
[string-module]: https://hexdocs.pm/elixir/String.html#functions
[access-behaviour]: https://hexdocs.pm/elixir/Access.html
