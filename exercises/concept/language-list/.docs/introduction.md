# Introduction

## Lists

Lists are built-in to the Elixir language. They are considered a basic type, denoted by square brackets. Lists may be empty or hold any number of items of any type. For example:

```elixir
empty_list = []
one_item_list = [1]
two_item_list = [1, 2]
multiple_type_list = [1, :pi, 3.14, "four"]
```

Elixir implements lists as a linked list, where each node stores two values: the first item and another list with all the remaining items. The first item in the list is referred to as the _head_ and the remaining list of items is called the _tail_. We can use this notation in code:

```elixir
# [1] represented in [head | tail] notation
[1 | []]

# [1, 2, 3] represented in [head | tail] notation
[1 | [2 | [3 | []]]]
```

We can use _`[head | tail]`_ notation to prepend elements to a list:

```elixir
# Suppose
list = [2, 1]

[3, 2, 1] == [3 | list]
# => true
```

There are several functions in the `Kernel` module for working with lists, as well as the whole `List` module.

```elixir
# Check if 1 is a member of the list
1 in [1, 2, 3, 4]
# => true
```
