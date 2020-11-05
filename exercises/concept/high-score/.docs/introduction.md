## maps

Maps in Elixir are the goto data structure for storing information in key-value pairs. In other languages, these might also be known as associative arrays (PHP), hashes (Perl 5, Raku), or dictionaries (Python).

Keys and values can be of any data type, but if the key is an atom we can use a shorthand syntax. Maps do not guarantee the order of their entries when accessed or returned.

### Literal forms

An empty map is simply declared with `%{}`. If we want to add items to a map literal, we can use two forms:

```elixir
# If the key is an atom:
%{atom_key: 1}

# If the key is a different type:
%{1 => :atom_value}

# You can even mix these if the atom form comes second:
%{"first_form" => :a, atom_form: :b}
```

While there is no canonical format, choose a consistent way to represent the key-value literal pairs.

### Map module functions

Elixir provides many functions for working with maps in the _Map module_. Some _Map module_ functions require an _anonymous_ or _captured function_ to be passed into the function to assist with the map transformation.

Maps also implement the _Enumerable protocol_, which allow them to be used in _Enum module_ functions. Often maps are transformed into a list, processed or transformed in some way, then returned. When a map is returned as a list, each key-value pair is returned as a tuple in the list.

## module-attributes-as-constants

In Elixir, we can define module attributes which can be used as constants in our functions.

```elixir
defmodule Example do

  # Defines the attribute as the value 1
  @constant_number 1

  def example_value() do
    # Returns the value 2
    @constant_number
  end
end
```

When used to define module constants, attributes can be any expression which can be evaluated at compilation time. After compilation, module attributes are not accessible since they are expanded during compilation, similar to defined macros in languages like C.
