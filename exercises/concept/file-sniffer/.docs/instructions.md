You have been working on a project which allows users to upload files to the server to be shared with other users. You have been tasked with writing a function to verify that an upload matches its [media type][mimetype]. You do some research and discover that the first few bytes of a file are generally unique to that filetype, giving it a sort of signature.

Use the following table for reference:

| File type | Common extension | Media type                   | binary 'signature'                               |
| --------- | ---------------- | ---------------------------- | ------------------------------------------------ |
| ELF       | `"exe"`          | `"application/octet-stream"` | `0x7F, 0x45, 0x4C, 0x46`                         |
| BMP       | `"bmp"`          | `"image/bmp"`                | `0x42, 0x4D`                                     |
| PNG       | `"png"`          | `"image/png"`                | `0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A` |
| JPG       | `"jpg"`          | `"image/jpg"`                | `0xFF, 0xD8, 0xFF`                               |
| GIF       | `"gif"`          | `"image/gif"`                | `0x47, 0x49, 0x46`                               |

## 1. Given an extension, return the expected media type

Implement the `type_from_extension/1` function. It should take a file extension (string) and return the media type (string).

```elixir
FileSniffer.type_from_extension("exe")
# => "application/octet-stream"
```

## 2. Given a binary file, return the expected media type

Implement the `type_from_binary/1` function. It should take a file (binary) and return the media type (string).

```elixir
file = File.read!("application.exe")
FileSniffer.type_from_binary(file)
# => "application/octet-stream"
```

Don't worry about reading the file as a binary, assume that has been done for you and will provided for the tests as an argument.

## 3. Given an extension and a binary file, verify that the file matches the expected type

Implement the `verify/2` function. It should take a file (binary) and extension (string) then an `:ok` or `:error` tuple.

```elixir
file = File.read!("application.exe")

FileSniffer.verify(file, "exe")
# => {:ok, "application/octet-stream"}

FileSniffer.verify(file, "png")
# => {:error, "Warning, file format and file extension do not match."}
```

[mimetype]: https://en.wikipedia.org/wiki/Media_type
