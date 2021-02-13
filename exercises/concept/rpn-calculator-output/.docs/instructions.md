# Instructions

Work is progressing well at _Instruments of Texas_ on the RPN Calculator. Your team now wants to be able to write a string version of the equation to an _IO_ resource.

## 1. Open a file

Your team hasn't decided what type of device to write the equation to, so you suggest using a _dynamic dispatch_ approach to be able to inject the resource into the function rather than hard-code it in. Implement the `write/3` function to open an _IO device_ using the resource and the filename.

You can assume `resource` will always be an atom that represents a module which has an `open/1` function that returns `{:ok, io_device}`.

When the function succeeds, return an ok-tuple with the equation.

```elixir
RPNCalculator.Output.write(resource, "file_to_be_written", "1 4 +")
# {:ok, "1 4 +"}
```

## 2. Attempt to write to the IO device

Now that you've opened the IO device, attempt to write to it using `IO.write/2`.

Extend the `write/3` function to perform this action. The write action attempt may raise an error, rescue from the error returning an error-tuple:

```elixir
RPNCalculator.Output.write(resource, "bad_file", "1 4 +")
# {:error, "Unable to write to resource"}
```

## 3. Close the IO device

It is a good practice to always try to release resources that you have opened, even if the function using the resource raises an error. Extend the `write/3` function to call the resource's close function to close the _IO device_.

You can assume `resource` will always be an atom that represents a module which has a `close/1` function which takes an _IO device_.
