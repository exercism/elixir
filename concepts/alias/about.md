# Alias

The [special form `alias`][alias] allows you to shorten or change the name by which you reference an outside module. A custom name can be specified with the `:as` option.

```elixir
defmodule Square do
  alias Integer, as: I

  def area(a), do: I.pow(a, 2)
end
```

When used without any arguments, it trims down the module name to its last part, e.g.

```elixir
alias MyApp.Account.User
# is the same as
alias MyApp.Account.User, as: User
```

Multiple aliases can be grouped together with `{}`:

```elixir
alias MyApp.Account.{User, EmailValidation}
# is the same as
alias MyApp.Account.User
alias MyApp.Account.EmailValidation
```

Usually aliases are added at the beginning of the module definition, but can be added anywhere. They have lexical scope, which means an alias added inside of a function definition won't be available in another function.

Unused aliases cause compiler warnings.

[alias]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#alias/2
