# Introduction

The special form `import` allows you to use functions from an outside module without using the module's name.

Importing a whole outside module might create conflicts with existing local functions. To avoid this, two options are available: `:except` and `:only`. Both expect a keyword list, where the key is the function name, and the value is the function's arity.

Usually imports are added at the beginning of the module definition.

```elixir
defmodule Square do
  import Integer, only: [pow: 2]
  
  def area(a), do: pow(a, 2)
end
```
