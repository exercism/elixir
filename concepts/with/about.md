# About

The [special form with][with] provides a way to focus on the "happy path" of a series of potentially failing steps and deal with the failures later.

Let's say that you want to validate a username with several checks. You might reach out for `case`:

```elixir
case check_ascii(username) do
  {:ok, username} ->
    case check_starts_with_letter(username) do
      {:ok, username} ->
        {:ok, username}

      {:error, "usernames may only start with a letter"} = err ->
        err
    end

  {:error, "usernames may only contain ascii letters"} = err ->
    err
end
```

It might be readable now, but if you add more nested checks, it's going to get messier. In this situation, use `with`:


```elixir
with {:ok, username} <- check_ascii(username),
     {:ok, username} <- check_starts_with_letter(username),
     {:ok, username} <- check_not_a_joke_name(username),
     {:ok, username} <- check_if_available(username) do
  {:ok, "#{username} is a fine username and you deserve it!"}
end
```

At each step, if a clause matches, the chain will continue until the `do` block is executed. If one match fails, the chain stops and the non-matching clause is returned.

You can use guards in the chain, as well as the `=` operator for regular matches.

```elixir
with {:ok, id} <- get_id(username),
     {:ok, avatar} when is_bitstring(avatar) <- fetch_avatar(id),
     avatar_size = bit_size(avatar),
     {:ok, image_type} <- check_valid_image_type(avatar) do
  {:ok, image_type, avatar_size, avatar}
end
```

Finally, you have the option of using an `else` block to catch failed matches and modify the return value.

```elixir
with {:ok, id} <- get_id(username),
     {:ok, avatar} when is_bitstring(avatar) <- fetch_avatar(id),
     avatar_size = bit_size(avatar),
     {:ok, image_type} <- check_valid_image_type(avatar) do
  {:ok, image_type, avatar_size, avatar}
else
  :not_found ->
    {:error, "invalid username"}

  {:error, "not an image"} ->
    {:error, "avatar associated to #{username} is not an image"}

  err ->
    err
end
```

The `else` is like a `case` statement for any mismatched value of the `with` clause. The first value to match will be used.

[with]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1
