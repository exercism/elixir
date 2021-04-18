defmodule FileSnifferTest do
  use ExUnit.Case

  @bmp_file File.read!(Path.join("assets", "bmp.bmp"))
  @gif_file File.read!(Path.join("assets", "gif.gif"))
  @jpg_file File.read!(Path.join("assets", "jpeg.jpg"))
  @png_file File.read!(Path.join("assets", "png-transparent.png"))
  @exe_file File.read!(Path.join("assets", "elf.o"))

  describe "get type from extension:" do
    test "bmp" do
      assert FileSniffer.type_from_extension("bmp") == "image/bmp"
    end

    test "gif" do
      assert FileSniffer.type_from_extension("gif") == "image/gif"
    end

    test "jpg" do
      assert FileSniffer.type_from_extension("jpg") == "image/jpg"
    end

    test "png" do
      assert FileSniffer.type_from_extension("png") == "image/png"
    end

    test "exe" do
      assert FileSniffer.type_from_extension("exe") == "application/octet-stream"
    end
  end

  describe "get type from binary:" do
    test "bmp" do
      assert FileSniffer.type_from_binary(@bmp_file) == "image/bmp"
    end

    test "gif" do
      assert FileSniffer.type_from_binary(@gif_file) == "image/gif"
    end

    test "jpg" do
      assert FileSniffer.type_from_binary(@jpg_file) == "image/jpg"
    end

    test "png" do
      assert FileSniffer.type_from_binary(@png_file) == "image/png"
    end

    test "exe" do
      assert FileSniffer.type_from_binary(@exe_file) == "application/octet-stream"
    end
  end

  describe "verify valid files" do
    test "bmp" do
      assert FileSniffer.verify(@bmp_file, "bmp") == {:ok, "image/bmp"}
    end

    test "gif" do
      assert FileSniffer.verify(@gif_file, "gif") == {:ok, "image/gif"}
    end

    test "jpg" do
      assert FileSniffer.verify(@jpg_file, "jpg") == {:ok, "image/jpg"}
    end

    test "png" do
      assert FileSniffer.verify(@png_file, "png") == {:ok, "image/png"}
    end

    test "exe" do
      assert FileSniffer.verify(@exe_file, "exe") == {:ok, "application/octet-stream"}
    end
  end

  describe "reject invalid files" do
    test "bmp" do
      assert FileSniffer.verify(@exe_file, "bmp") ==
               {:error, "Warning, file format and file extension do not match."}
    end

    test "gif" do
      assert FileSniffer.verify(@exe_file, "gif") ==
               {:error, "Warning, file format and file extension do not match."}
    end

    test "jpg" do
      assert FileSniffer.verify(@exe_file, "jpg") ==
               {:error, "Warning, file format and file extension do not match."}
    end

    test "png" do
      assert FileSniffer.verify(@exe_file, "png") ==
               {:error, "Warning, file format and file extension do not match."}
    end

    test "exe" do
      assert FileSniffer.verify(@png_file, "exe") ==
               {:error, "Warning, file format and file extension do not match."}
    end
  end
end
