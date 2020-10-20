[Structs][getting-started] are special [maps][maps] with a defined set of keys.

- Structs provide compile-time checks and default values.
- A struct is named after the module it is defined in.
- To define a struct use the [`defstruct`][docs-defstruct] construct.
  - The construct usually immediately follows after the module definition.
- `defstruct` accepts either a list of [atoms][atom] (for nil default values) or key-value tuples (for specified default values).
  - The fields without defaults must precede the fields with default values.

```elixir
defmodule Plane do
  defstruct [:engine, wings: 2]
end

plane = %Plane{}
# => %Plane{engine: nil, wings: 2}
```

## Accessing fields and updating

- Most functions that work with [maps][maps] will also work with structs.
  - The [_Access Behavior_][access-behavior] is an exception and is **not** implemented for structs unless specifically implemented.
- It is recommended to use the _static access operator_ `.` to access struct fields.

- Get/fetch field values:

  ```elixir
  plane = %Plane{}
  plane.engine
  # => nil
  Map.fetch(plane, :wings)
  # => 2
  ```

- Update field values

  ```elixir
  plane = %Plane{}
  %{plane | wings: 4}
  # => %Plane{engine: nil, wings: 4}
  ```

## Enforcing Field Value Initialization

- The `@enforce_keys` [module attribute][attribute] creates a run-time check that specified fields must be initialized to a **non**-`nil` value when the struct is created.
- `@enforce_keys` is followed by a list of the field keys (which are [atoms][atom]).
- If an enforced key is not initialized, an error is raised.

```elixir
defmodule User do
  @enforce_keys [:username]
  defstruct [:username]
end

%User{}
# => (ArgumentError) the following keys must also be given when building struct User: [:username]
```

[atom]: https://elixir-lang.org/getting-started/basic-types.html#atoms
[access-behavior]: https://hexdocs.pm/elixir/Access.html#content
[attribute]: https://elixir-lang.org/getting-started/module-attributes.html
[maps]: https://hexdocs.pm/elixir/Map.html#content
[getting-started]: https://elixir-lang.org/getting-started/structs.html
[docs-defstruct]: https://hexdocs.pm/elixir/Kernel.html#defstruct/1
