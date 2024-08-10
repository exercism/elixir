# Introduction

## Structs

Structs are an extension built on top of [maps][exercism-maps] which provide compile-time checks and default values. A struct is named after the module it is defined in. To define a struct use the `defstruct` construct. The construct usually immediately follows after the module definition. `defstruct` accepts either a list of atoms (for `nil` default values) or a keyword list (for specified default values). The fields without defaults must precede the fields with default values.

```elixir
defmodule Plane do
  defstruct [:engine, wings: 2]
end

plane = %Plane{}
# => %Plane{engine: nil, wings: 2}
```

### Accessing fields and updating

Since structs are built on maps, we can use most map functions to get and manipulate values. The _Access Behaviour_ is **not** implemented for structs. It is recommended to use the _static access operator_ `.` to access struct fields instead.

- get/fetch field values:

  ```elixir
  plane = %Plane{}
  plane.engine
  # => nil
  Map.fetch(plane, :wings)
  # => {:ok, 2}
  ```

- update field values

  ```elixir
  plane = %Plane{}
  %{plane | wings: 4}
  # => %Plane{engine: nil, wings: 4}
  ```

### Pattern matching

Structs can be used in pattern matching with or without the struct name.

```elixir
plane = %Plane{}
%Plane{wings: wings} = plane
%{wings: wings} = plane
```

By including the struct name in the pattern, you can ensure that both the left and right side are structs of the same type.

```elixir
defmodule Helicopter do
  defstruct [:engine, rotors: 1]
end

%Plane{} = %Helicopter{}
# => (MatchError) no match of right hand side value: %Helicopter{engine: nil, rotors: 1}
```

### Enforcing field value initialization

We can use the `@enforce_keys` module attribute with a list of the field keys to ensure that the values are initialized when the struct is created. If a key is not listed, its value will be `nil` as seen in the above example. If an enforced key is not initialized, an error is raised.

```elixir
defmodule User do
  @enforce_keys [:username]
  defstruct [:username]
end

%User{}
# => (ArgumentError) the following keys must also be given when building struct User: [:username]
```

[exercism-maps]: https://exercism.org/tracks/elixir/concepts/maps
