# Introduction

## Alias

To share code between different Elixir modules within the same project, you need to reference the outside module by its full name. But what if that name is too long or confusing?

The special form `alias` allows you to shorten or change the name by which you reference an outside module. When used without any arguments, it trims down the module name to its last segment, e.g. `MyApp.Logger.Settings` becomes `Settings`. A custom name can be specified with the `:as` option.

Usually aliases are added at the beginning of the module definition.

```elixir
defmodule Square do
  alias Integer, as: I

  def area(a), do: I.pow(a, 2)
end
```

## Import

The special form `import` allows you to use functions from an outside module without using the module's name.

Importing a whole outside module might create conflicts with existing local functions. To avoid this, two options are available: `:except` and `:only`. Both expect a keyword list, where the key is the function name, and the value is the function's arity.

Usually imports are added at the beginning of the module definition.

```elixir
defmodule Square do
  import Integer, only: [pow: 2]

  def area(a), do: pow(a, 2)
end
```
