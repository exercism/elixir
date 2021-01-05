Functions for working with files are provided by the [`File`][file] module.

To read a whole file, use [`File.read/1`][file-read]. To write to a file, use [`File.write/2`][file-write].

The module also provides file functions for copying, removing, renaming etc. Their names are similar to their unix equivalents, for example:

- [`File.cp/3`][file-cp] - copy a file
- [`File.rm/1`][file-rm] - delete a file
- [`File.rename/2`][file-rename] - rename and/or move a file
- [`File.mkdir/1`][file-mkdir] - create a directory
- [`File.cwd/0`][file-cwd] - get the current working directory

All the mentioned functions from the `File` module also have a `!` variant that raises an error instead of returning an error tuple (e.g. [`File.read!/1`][file-read-bang]). Use that variant if you don't intend to handle errors such missing files or lack of permissions.

```elixir
File.read("does_not_exist")
# => {:error, :enoent}

File.read!("does_not_exist")
# => ** (File.Error) could not read file "does_not_exist": no such file or directory
#        (elixir 1.10.4) lib/file.ex:353: File.read!/1
```

## Files and processes

Every time a file is written to with [`File.write/2`][file-write], a file descriptor is opened and a new Elixir process is spawned. For this reason, writing to a file in a loop using [`File.write/2`][file-write] should be avoided.

Instead, a file can be opened using [`File.open/2`][file-open]. The second argument to [`File.open/2`][file-open] is a list of modes, which allows you to specify if you want to open the file for reading or for writing.

Commonly-used modes are:

- `:read` - open for reading, file must exist
- `:write` - open for writing, file will be created if doesn't exist, existing content will be overwritten
- `:append` - open for writing, file will be created if doesn't exist, existing content will be preserved

For a comprehensive list of all modes, see the documentation of [`File.open/2`][file-open].

[`File.open/2`][file-open] returns a PID of a process that handles the file. To read and write to the file, use functions from the [`IO`][io] module and pass this PID as the [IO device][io-io-devices].

When you're finished working with the file, close it with [`File.close/1`][file-close].

```elixir
file = File.open!("README.txt", [:write])
# => #PID<0.157.0>

IO.puts(file, "# README")
# => :ok

File.close(file)
# => :ok
```

## Streaming files

Reading a file with [`File.read/1`][file-read] is going to load the whole file into memory all at once. This might be a problem when working with really big files. To handle them efficiently, you might use [`File.open/2`][file-open] and [`IO.read/2`][io-read] to read the file line by line, or you can stream the file with [`File.stream/3`][file-stream]. The stream implements both the [`Enumerable`][enumerable] and [`Collectable`][collectable] protocols, which means it can be used both for reading and writing.

```elixir
File.stream!("file.txt")
|> Stream.map(& &1 <> "!")
|> Stream.into(File.stream!("new_file.txt"))
|> Stream.run()
```

## Paths

All the functions working on files require a file path. File paths can be absolute or relative to the current directory. For manipulating paths, use functions from the [`Path`][path] module. For cross-platform compatibility, use [`Path.join/1`][path-join] to create paths. It will choose the platform-appropriate separator.

```elixir
Path.expand(Path.join(["~", "documents", "important.txt"]))
"/home/user/documents/important.txt"
```

[file]: https://hexdocs.pm/elixir/File.html
[io]: https://hexdocs.pm/elixir/IO.html
[file-read]: https://hexdocs.pm/elixir/File.html#read/1
[file-read-bang]: https://hexdocs.pm/elixir/File.html#read!/1
[file-write]: https://hexdocs.pm/elixir/File.html#write/3
[file-cp]: https://hexdocs.pm/elixir/File.html#cp/3
[file-rm]: https://hexdocs.pm/elixir/File.html#rm/1
[file-cwd]: https://hexdocs.pm/elixir/File.html#cwd/0
[file-rename]: https://hexdocs.pm/elixir/File.html#rename/2
[file-copy]: https://hexdocs.pm/elixir/File.html#cp/3
[file-open]: https://hexdocs.pm/elixir/File.html#open/2
[file-close]: https://hexdocs.pm/elixir/File.html#close/1
[file-stream]: https://hexdocs.pm/elixir/File.html#stream!/3
[io-io-devices]: https://hexdocs.pm/elixir/IO.html#module-io-devices
[io-read]: https://hexdocs.pm/elixir/IO.html#read/2
[enumerable]: https://hexdocs.pm/elixir/Enumerable.html
[collectable]: https://hexdocs.pm/elixir/Collectable.html
[path]: https://hexdocs.pm/elixir/Path.html
[path-join]: https://hexdocs.pm/elixir/Path.html#join/1
