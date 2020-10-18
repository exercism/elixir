A keyword list is a list of `{key, value}` tuples. There are two way to write a keyword list:

```elixir
# concise
[month: "April", year: 2018]

# explicit
[{:month, "April"}, {:year, 2018}]
```

## Keys must be atoms

Not every list of 2-tuples is a keyword list. The keys must be atoms:

```elixir
Keyword.keyword?([{"month", "April"}])
# => false
```

If you want to use characters other than letters, numbers, and `_` in the key, you need to wrap it in quotes. However, that does not make it a string - it is still an atom.

```elixir
Keyword.keyword?(["day of week": "Monday"])
# => true
```

## Keys can repeat

Keys in a keyword list can repeat, and the [key/value pairs are ordered][keyword-duplicate-keys-and-ordering]. When attempting to get a single value under a given key, you will get the first value, and any other values under the same key will be silently ignored.

```elixir
list = [month: "April", month: "May"]

Keyword.get_values(list, :month)
# => ["April", "May"]

Keyword.get(list, :month)
# => "April"
```

Keyword lists also support the [_Access behaviour_][access-behaviour].

```elixir
list[:month]
# => "April"
```

## Keyword lists as options

The characteristics of keyword lists made them the default mechanism for passing options to functions in Elixir.

When learning about `if`, you saw a special shorter syntax:

```elixir
if age >= 16, do: "beer", else: "no beer"
```

This may look like `if` accepts two arguments, but the `do:` and `else:` pair is actually a single argument - a keyword list. The same code could be written as:

```elixir
if age >= 16, [do: "beer", else: "no beer"]
# or
if age >= 16, [{:do, "beer"}, {:else, "no beer"}]
```

The usage of keyword lists as function options is so common that Elixir allows you to [skip the square brackets when the keyword list is the last argument][keyword-call-syntax] passed to a function.

Since tuples, lists, maps, and others are treated the same as function calls in Elixir syntax, this property is also available to them.

```elixir
[1, 2, three: 3]
# => [1, 2, {:three, 3}]
```

## Pattern matching

To successfully pattern match on a keyword list using the concise syntax, you would need to specify all of the keys in the correct order. This makes pattern matching an unlikely choice for working with keyword lists. Use the [`Keyword`][keyword] module or [_Access behaviour_][access-behaviour] instead.

```elixir
[month: month] = [month: "April", year: 2018]
# => ** (MatchError) no match of right hand side value: [month: "April", year: 2018]

[year: year, month: month] = [month: "April", year: 2018]
# => ** (MatchError) no match of right hand side value: [month: "April", year: 2018]
```

## Keyword lists vs maps

|                  | Keyword list                  | Map                                 |
| ---------------- | ----------------------------- | ----------------------------------- |
| Key type         | Atoms                         | Any, can be mixed in one map        |
| Duplicate keys   | Yes                           | No                                  |
| Keys ordered     | Yes                           | No                                  |
| Access           | `list[:key]`, `Keyword.get/2` | `map.key`, `map[:key]`, `Map.get/2` |
| Access time      | Linear                        | Logarithmic                         |
| Pattern matching | Not very useful               | Useful                              |

Faster access time, flexible key type, and useful pattern matching makes maps the default choice in most cases.

Use keyword lists when you don't have a lot of data, but need duplicate keys or keys in a specific order.

[keyword-duplicate-keys-and-ordering]: https://hexdocs.pm/elixir/Keyword.html#module-duplicate-keys-and-ordering
[keyword]: https://hexdocs.pm/elixir/Keyword.html
[access-behaviour]: https://hexdocs.pm/elixir/Access.html
[keyword-call-syntax]: https://hexdocs.pm/elixir/Keyword.html#module-call-syntax
