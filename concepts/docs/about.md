# About

Elixir documentation:

- A first-class citizen.
- Written in [**Markdown**][markdown].
- Added by using special module attributes.
- Typically uses the heredoc syntax for multiline strings.

Module attributes used for documentation:

- `@moduledoc` - describes a module, appears on the first line of the module.
- `@doc` - describes a function, appears right above the function's definition and its typespec.
- `@typedoc`- describes a custom type, appears right above the type's definition.

```elixir
defmodule String do
  @moduledoc """
  Strings in Elixir are UTF-8 encoded binaries.
  """

  @typedoc """
  A UTF-8 encoded binary.
  """
  @type t :: binary

  @doc """
  Converts all characters in the given string to uppercase according to `mode`.

  ## Examples

      iex> String.upcase("abcd")
      "ABCD"

      iex> String.upcase("olá")
      "OLÁ"
  """
  def upcase(string, mode \\ :default)
end
```

## [Documentation vs. code comments][documentation-vs-comments]

Elixir treats documentation and code comments as two different concepts.

Documentation is an explicit contract between you and the users of your public API (which also includes your coworkers and your future self). Those users might or might not have access to the source code, so the documentation explains how to use your code.

Code comments are aimed at developers reading the source code. They are useful for leaving notes, explaining implementation details, marking opportunities for improvement, and so on.

Because documentation is meant to describe the public API of your code, trying to add a `@doc` attribute to a private function will result in a compilation warning. For explaining private functions, use code comments instead.

```
warning: defp do_check_length/2 is private, @doc attribute is always discarded for private functions/macros/types
  lib/form.ex:33: Form.do_check_length/2
```

## Consuming documentation

There are many different ways to access the documentation of an Elixir project.

### `hexdocs.pm` and `ExDoc`

[`hex.pm`][hex-pm] is a package repository for Elixir and Erlang. Every package published to `hex.pm` will get its documentation automatically published to [`hexdocs.pm`][hexdocs-pm]. There, you can find the documentation for all your favorite Elixir libraries, as well as [Elixir's official documentation][official-documentation] itself.

You can generate a documentation website for your project that looks exactly like Elixir's official documentation without having to publish a package to `hex.pm`. The tool that does it is called [`ExDoc`][ex-doc]. `ExDoc` will produce HTML files that you can browse from your local filesystem.

Make sure to follow the [official recommendations for writing documentation][writing-documentation-recommendations] to ensure best results when using `ExDoc`.

### The `h` IEx helper

You can access the documentation of the standard library, as well as any library you have installed and your Elixir project, directly from your computer.

If you have Elixir installed on your computer, you can use it in [the interactive mode][getting-started-iex] by running the `iex` command (or `iex -S mix` if you want to load the source of your current mix project).

In `iex`, you can type [`h`][iex-h], followed by a space and a module name or a function name, to read its documentation.

[]: # (elixir-formatter-disable-next-block)

```elixir
iex()> h String.upcase/1
# def upcase(string, mode \\ :default)
#
# Converts all characters in the given string to uppercase according to mode.
# (...)
```

By pressing the tab key after providing a partial module or function name, you can leverage the autocomplete option to discover available modules and functions.

### Modern IDEs

Many modern IDEs that support Elixir can parse and display documentation and typespecs in useful pop-ups, for example [Visual Studio Code][vsc-documentation] or [Intellij with the Elixir plugin][intellij-elixir-documentation].

## Internal modules and function

If a module or a function is intended for internal usage only, you can mark it with `@moduledoc false` or `@doc false`. Those modules and functions will not be included in the generated documentation. Note that that doesn't make them private. They can still be invoked and/or imported. Check the [official documentation about hiding internal modules and functions][hiding-internal-modules-and-functions] to learn about potential solutions to this problem.

[markdown]: https://docs.github.com/en/github/writing-on-github/basic-writing-and-formatting-syntax
[official-documentation]: https://hexdocs.pm/elixir/
[ex-doc]: https://hexdocs.pm/ex_doc/readme.html
[hex-pm]: https://hex.pm/
[hexdocs-pm]: https://hexdocs.pm/
[writing-documentation-recommendations]: https://hexdocs.pm/elixir/writing-documentation.html#recommendations
[intellij-elixir-documentation]: https://github.com/KronicDeth/intellij-elixir#quick-documentation
[vsc-documentation]: https://fly.io/phoenix-files/setup-vscode-for-elixir-development/
[iex-h]: https://hexdocs.pm/iex/IEx.Helpers.html#h/1
[getting-started-iex]: https://hexdocs.pm/elixir/introduction.html#interactive-mode
[hiding-internal-modules-and-functions]: https://hexdocs.pm/elixir/writing-documentation.html#hiding-internal-modules-and-functions
[documentation-vs-comments]: https://hexdocs.pm/elixir/writing-documentation.html#documentation-code-comments
