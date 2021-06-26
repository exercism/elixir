# Introduction

The special form `alias` allows you to shorten or change the name by which you reference an outside module. When used without any arguments, it trims down the module name to its last part, e.g. `MyApp.Logger.Settings` becomes `Settings`. A custom name can be specified with the `:as` option.

Usually aliases are added at the beginning of the module definition.

```elixir
defmodule Square do
  alias Integer, as: I
  
  def area(a), do: I.pow(a, 2)
end
```
