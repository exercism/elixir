# Concepts for `bank-account`

## Example solutions

### Agent

[by @adamzaninovich](https://exercism.io/tracks/elixir/exercises/bank-account/solutions/02dea8fa44014c40b1b3963498097fcb)

```elixir
defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank do
    {:ok, account} = Agent.start(fn -> 0 end)
    account
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    :ok = Agent.stop(account)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    Agent.get(account, &(&1))
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    Agent.update(account, &(&1 + amount))
  end
end
```

### GenServer

[by @aaroncm (adapted)](https://exercism.io/tracks/elixir/exercises/bank-account/solutions/961596ab0cce445aa918452137feae1b)

```elixir
defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  use GenServer

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  def init(_args), do: {:ok, 0}

  def handle_call(:balance, _from, balance), do: {:reply, balance, balance}

  def handle_call({:update, amt}, _from, balance), do: {:reply, :ok, balance + amt}

  def handle_call(:close, _from, balance), do: {:stop, :normal, balance}

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {:ok, pid} = GenServer.start(__MODULE__, 0, [])
    pid
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    GenServer.call(account, :close)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    GenServer.call(account, :balance)
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    GenServer.call(account, {:update, amount})
  end
end
```

### `send/2` and `receive/1`

[by @opsb (adapted)](https://exercism.io/tracks/elixir/exercises/bank-account/solutions/d8d4ab8d4b2b47509cf1976fb93da0a1)

```elixir
defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    spawn(fn -> loop(0) end)
  end

  defp loop(balance) do
    receive do
      {:balance, caller} ->
        send caller, {:balance, balance}
        loop(balance)
      {:update, amount} ->
        loop(balance + amount)
      :close -> nil
    end
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    send account, :close
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    send account, {:balance, self}
    receive do
      {:balance, balance} -> balance
    end
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    send account, {:update, amount}
  end
end
```

## List of concepts

- naming
- modules
- module attributes
  - @moduledoc
  - @doc
  - @spec
- pattern matching
- standard library
  - GenServer
    - @impl
    - `handle_call/3`
    - `handle_cast/3`
  - Agent
    - `start/1`
    - `stop/1`
    - `get/2`
    - `update/2`
- types
  - integer
  - atom
  - tuple
    - `:ok`/`:error`
    - `:reply`/`:noreply`
- functions
  - capture syntax
- message passing
  - `send/2`
  - `receive/1`
