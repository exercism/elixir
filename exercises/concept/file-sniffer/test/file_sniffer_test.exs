defmodule FileSnifferTest do
  use ExUnit.Case

  @bmp_file File.read!("assets/bmp.bmp" )
  @gif_file File.read!("assets/gif.gif")
  @jpg_file File.read!("assets/jpeg.jpg")
  @png_file File.read!("assets/png-transparent.png")
  @exe_file File.read!("assets/elf.o")

  describe "get type from extension:" do
    # @tag :pending
    test "bmp" do
      assert FileSniffer.type_from_extension("bmp") == {:ok, "image/bmp"}
    end

    @tag :pending
    test "gif" do
      assert FileSniffer.type_from_extension("gif") == {:ok, "image/gif"}
    end

    @tag :pending
    test "jpg" do
      assert FileSniffer.type_from_extension("jpg") == {:ok, "image/jpg"}
    end

    @tag :pending
    test "png" do
      assert FileSniffer.type_from_extension("png") == {:ok, "image/png"}
    end

    @tag :pending
    test "exe" do
      assert FileSniffer.type_from_extension("exe") == {:ok, "application/octet-stream"}
    end
  end

  describe "get type from binary:" do
    @tag :pending
    test "bmp" do
      assert FileSniffer.type_from_binary(@bmp_file) == {:ok, "image/bmp"}
    end

    @tag :pending
    test "gif" do
      assert FileSniffer.type_from_binary(@gif_file) == {:ok, "image/gif"}
    end

    @tag :pending
    test "jpg" do
      assert FileSniffer.type_from_binary(@jpg_file) == {:ok, "image/jpg"}
    end

    @tag :pending
    test "png" do
      assert FileSniffer.type_from_binary(@png_file) == {:ok, "image/png"}
    end

    @tag :pending
    test "exe" do
      assert FileSniffer.type_from_binary(@exe_file) == {:ok, "application/octet-stream"}
    end
  end

  describe "verify valid files" do
    @tag :pending
    test "bmp" do
      assert FileSniffer.verify(@bmp_file, "bmp") == {:ok, "image/bmp"}
    end

    @tag :pending
    test "gif" do
      assert FileSniffer.verify(@gif_file, "gif") == {:ok, "image/gif"}
    end

    @tag :pending
    test "jpg" do
      assert FileSniffer.verify(@jpg_file, "jpg") == {:ok, "image/jpg"}
    end

    @tag :pending
    test "png" do
      assert FileSniffer.verify(@png_file, "png") == {:ok, "image/png"}
    end

    @tag :pending
    test "exe" do
      assert FileSniffer.verify(@exe_file, "exe") == {:ok, "application/octet-stream"}
    end
  end

  describe "reject invalid files" do
    @tag :pending
    test "bmp" do
      assert FileSniffer.verify(@exe_file, "bmp") == {:error, "Warning, file format and file extension do not match."}
    end

    @tag :pending
    test "gif" do
      assert FileSniffer.verify(@exe_file, "gif") == {:error, "Warning, file format and file extension do not match."}
    end

    @tag :pending
    test "jpg" do
      assert FileSniffer.verify(@exe_file, "jpg") == {:error, "Warning, file format and file extension do not match."}
    end

    @tag :pending
    test "png" do
      assert FileSniffer.verify(@exe_file, "png") == {:error, "Warning, file format and file extension do not match."}
    end

    @tag :pending
    test "exe" do
      assert FileSniffer.verify(@png_file, "exe") == {:error, "Warning, file format and file extension do not match."}
    end
  end
end
