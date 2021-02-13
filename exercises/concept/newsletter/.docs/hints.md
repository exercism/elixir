# Hints

## 1. General

- Read about files in the official [Getting Started guide][getting-started-file].
- Read about files on [joyofelixir.com][joy-of-elixir-file].
- Take a look at the [documentation of the `File` module][file].

## 1. Read email addresses from a file

- There is a [built-in function][file-read] for reading the contents of a file all at once.

## 2. Open a log file for writing

- There is a [built-in function][file-open] for opening a file.
- The second argument of that function is a list of modes which allows specifying that the file should be opened for writing.

## 3. Log a sent email

- Functions for reading and writing to a file opened with [`File.open!/1`][file-open] can be found in the [`IO`][io] module.
- There is a [built-in function][io-puts] for writing a string to a file, followed by a newline.

## 4. Close the log file

- There is a [built-in function][file-close] for closing a file.

## 5. Send the newsletter

- All the necessary operations on files were already implemented in the previous steps.
- Before writing to a file, the file must be opened.
- After all write operations to a file finished, the file should be closed.

[getting-started-file]: https://elixir-lang.org/getting-started/io-and-the-file-system.html#the-file-module
[joy-of-elixir-file]: https://joyofelixir.com/11-files/
[file]: https://hexdocs.pm/elixir/File.html
[file-read]: https://hexdocs.pm/elixir/File.html#read!/1
[file-open]: https://hexdocs.pm/elixir/File.html#open!/1
[file-close]: https://hexdocs.pm/elixir/File.html#close/1
[io]: https://hexdocs.pm/elixir/IO.html
[io-puts]: https://hexdocs.pm/elixir/IO.html#puts/2
