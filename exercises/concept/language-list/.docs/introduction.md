## lists

Lists are built-in to the Elixir language. They are considered a basic type, denoted by square brackets. Lists may be empty or hold any number of items of any type. For example:

```elixir
empty_list = []
one_item_list = [1]
two_item_list = [1, 2]
multiple_type_list = [1, :pi, 3.14]
```

Elixir implements lists as a linked list, where each node stores the reference to the next list. The first item in the list is referred to as the _head_ and the remaining list of items is called the _tail_. We can use this notation in code:

```elixir
# [1] represented in [head | tail] notation
[1 | []]

# [1, 2, 3] represented in [head | tail] notation
[1 | [2 | 3 | []]]
```

We can use _`[head | tail]`_ notation to prepend elements to a list:

```elixir
# Suppose
list = [2, 1]

[3, 2, 1] == [3 | list]
# => true
```

There are several Elixir Kernel functions for working with lists, e.g.

```elixir
# Check if 1 is a member of the list
1 in [1, 2, 3, 4]
# => true
```

String literals are a sequence of characters surrounded by double quotes.

```elixir
string_variable = "this is a string! 1, 2, 3!"

# Check if "c" is a member of the list
"c" in ["a", "b", "c", "d"]
# => true
```
