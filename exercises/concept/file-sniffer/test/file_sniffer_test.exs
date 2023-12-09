defmodule FileSnifferTest do
  use ExUnit.Case

  @bmp_file File.read!(Path.join("assets", "bmp.bmp"))
  @gif_file File.read!(Path.join("assets", "gif.gif"))
  @jpg_file File.read!(Path.join("assets", "jpeg.jpg"))
  @png_file File.read!(Path.join("assets", "png-transparent.png"))
  @exe_file File.read!(Path.join("assets", "elf.o"))
  @dat_file File.read!(Path.join("assets", "data.dat"))

  describe "get type from extension" do
    @tag task_id: 1
    test "bmp" do
      assert FileSniffer.type_from_extension("bmp") == "image/bmp"
    end

    @tag task_id: 1
    test "gif" do
      assert FileSniffer.type_from_extension("gif") == "image/gif"
    end

    @tag task_id: 1
    test "jpg" do
      assert FileSniffer.type_from_extension("jpg") == "image/jpg"
    end

    @tag task_id: 1
    test "png" do
      assert FileSniffer.type_from_extension("png") == "image/png"
    end

    @tag task_id: 1
    test "exe" do
      assert FileSniffer.type_from_extension("exe") == "application/octet-stream"
    end
  end

  describe "return nil when type doesn't match" do
    @tag task_id: 1
    test "txt" do
      assert FileSniffer.type_from_extension("txt") == nil
    end

    @tag task_id: 1
    test "md" do
      assert FileSniffer.type_from_extension("md") == nil
    end

    @tag task_id: 1
    test "dat" do
      assert FileSniffer.type_from_extension("dat") == nil
    end
  end

  describe "get type from binary" do
    @tag task_id: 2
    test "bmp" do
      assert FileSniffer.type_from_binary(@bmp_file) == "image/bmp"
    end

    @tag task_id: 2
    test "gif" do
      assert FileSniffer.type_from_binary(@gif_file) == "image/gif"
    end

    @tag task_id: 2
    test "jpg" do
      assert FileSniffer.type_from_binary(@jpg_file) == "image/jpg"
    end

    @tag task_id: 2
    test "png" do
      assert FileSniffer.type_from_binary(@png_file) == "image/png"
    end

    @tag task_id: 2
    test "exe" do
      assert FileSniffer.type_from_binary(@exe_file) == "application/octet-stream"
    end
  end

  describe "return nil when given uncompleted signature file" do
    @tag task_id: 2
    test "bmp" do
      assert FileSniffer.type_from_binary(String.slice(@bmp_file, 0..0)) == nil
    end

    @tag task_id: 2
    test "gif" do
      assert FileSniffer.type_from_binary(String.slice(@gif_file, 0..1)) == nil
    end

    @tag task_id: 2
    test "jpg" do
      assert FileSniffer.type_from_binary(String.slice(@jpg_file, 0..1)) == nil
    end

    @tag task_id: 2
    test "png" do
      assert FileSniffer.type_from_binary(String.slice(@png_file, 0..5)) == nil
    end

    @tag task_id: 2
    test "exe" do
      assert FileSniffer.type_from_binary(String.slice(@exe_file, 0..2)) == nil
    end
  end

  describe "return nil when given unknown signature" do
    @tag task_id: 2
    test "dat" do
      assert FileSniffer.type_from_binary(@dat_file) == nil
    end
  end

  describe "return nil when input is a bitstring, but not a binary" do
    @tag task_id: 2
    test "bmp" do
      assert FileSniffer.type_from_binary(<<0x42, 0x4D, 0::1>>) == nil
    end

    @tag task_id: 2
    test "gif" do
      assert FileSniffer.type_from_binary(<<0x47, 0x49, 0x46, 0::1>>) == nil
    end

    @tag task_id: 2
    test "jpg" do
      assert FileSniffer.type_from_binary(<<0xFF, 0xD8, 0xFF, 0::1>>) == nil
    end

    @tag task_id: 2
    test "png" do
      assert FileSniffer.type_from_binary(
               <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0::1>>
             ) == nil
    end

    @tag task_id: 2
    test "exe" do
      assert FileSniffer.type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, 0::1>>) == nil
    end
  end

  describe "verify valid files" do
    @tag task_id: 3
    test "bmp" do
      assert FileSniffer.verify(@bmp_file, "bmp") == {:ok, "image/bmp"}
    end

    @tag task_id: 3
    test "gif" do
      assert FileSniffer.verify(@gif_file, "gif") == {:ok, "image/gif"}
    end

    @tag task_id: 3
    test "jpg" do
      assert FileSniffer.verify(@jpg_file, "jpg") == {:ok, "image/jpg"}
    end

    @tag task_id: 3
    test "png" do
      assert FileSniffer.verify(@png_file, "png") == {:ok, "image/png"}
    end

    @tag task_id: 3
    test "exe" do
      assert FileSniffer.verify(@exe_file, "exe") == {:ok, "application/octet-stream"}
    end
  end

  describe "reject invalid files" do
    @tag task_id: 3
    test "bmp" do
      assert FileSniffer.verify(@exe_file, "bmp") ==
               {:error, "Warning, file format and file extension do not match."}
    end

    @tag task_id: 3
    test "gif" do
      assert FileSniffer.verify(@exe_file, "gif") ==
               {:error, "Warning, file format and file extension do not match."}
    end

    @tag task_id: 3
    test "jpg" do
      assert FileSniffer.verify(@exe_file, "jpg") ==
               {:error, "Warning, file format and file extension do not match."}
    end

    @tag task_id: 3
    test "png" do
      assert FileSniffer.verify(@exe_file, "png") ==
               {:error, "Warning, file format and file extension do not match."}
    end

    @tag task_id: 3
    test "exe" do
      assert FileSniffer.verify(@png_file, "exe") ==
               {:error, "Warning, file format and file extension do not match."}
    end
  end

  describe "reject unknown file types" do
    @tag task_id: 3
    test "dat" do
      assert FileSniffer.verify(@dat_file, "dat") ==
               {:error, "Warning, file format and file extension do not match."}
    end
  end
end
