## File

Functions for working with files are provided by the `File` module.

To read a whole file, use `File.read/1`. To write to a file, use `File.write/2`.

Every time a file is written to with `File.write/2`, a file descriptor is opened and a new Elixir process is spawned. For this reason, writing to a file in a loop using `File.write/2` should be avoided.

Instead, a file can be opened using `File.open/2`. The second argument to `File.open/2` is a list of modes, which allows you to specify if you want to open the file for reading or for writing.

`File.open/2` returns a PID of a process that handles the file. To read and write to the file, use functions from the `IO` module and pass this PID as the IO device.

When you're finished working with the file, close it with `File.close/1`.

All the mentioned functions from the `File` module also have a `!` variant that raises an error instead of returning an error tuple (e.g. `File.read!/1`). Use that variant if you don't intend to handle errors such missing files or lack of permissions.
