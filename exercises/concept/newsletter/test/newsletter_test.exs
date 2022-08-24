defmodule NewsletterTest do
  use ExUnit.Case, async: true

  setup do
    rand = Integer.to_string(:rand.uniform(2**32), 32)
    temp_file = Path.join([System.tmp_dir!, "temp-#{rand}.txt"])

    File.write!(temp_file, "")
    on_exit(fn -> File.rm!(temp_file) end)

    [temp_file: temp_file]
  end

  describe "read_emails" do
    @tag task_id: 1
    test "returns a list of all lines in a file" do
      emails_file_path = Path.join(["assets", "emails.txt"])

      assert Newsletter.read_emails(emails_file_path) == [
               "alice@example.com",
               "bob@example.com",
               "charlie@example.com",
               "dave@example.com"
             ]
    end

    @tag task_id: 1
    test "returns an empty list if the file is empty" do
      empty_file_path = Path.join(["assets", "empty.txt"])
      assert Newsletter.read_emails(empty_file_path) == []
    end
  end

  describe "open_log" do
    @tag task_id: 2
    test "returns a pid", context do
      file = Newsletter.open_log(context.temp_file)
      assert is_pid(file)
      File.close(file)
    end

    @tag task_id: 2
    test "opens the file for writing", context do
      file = Newsletter.open_log(context.temp_file)
      assert IO.write(file, "hello") == :ok
      assert File.read!(context.temp_file) == "hello"
      File.close(file)
    end
  end

  describe "log_sent_email" do
    @tag task_id: 3
    test "returns ok", context do
      file = File.open!(context.temp_file, [:write])
      assert Newsletter.log_sent_email(file, "janice@example.com") == :ok
      File.close(file)
    end

    @tag task_id: 3
    test "writes the email address to the given file", context do
      file = File.open!(context.temp_file, [:write])
      Newsletter.log_sent_email(file, "joe@example.com")
      assert File.read!(context.temp_file) == "joe@example.com\n"
      File.close(file)
    end

    @tag task_id: 3
    test "writes many email addresses to the given file", context do
      file = File.open!(context.temp_file, [:write])
      Newsletter.log_sent_email(file, "joe@example.com")
      Newsletter.log_sent_email(file, "kathrine@example.com")
      Newsletter.log_sent_email(file, "lina@example.com")

      assert File.read!(context.temp_file) ==
               "joe@example.com\nkathrine@example.com\nlina@example.com\n"

      File.close(file)
    end
  end

  describe "close_log" do
    @tag task_id: 4
    test "returns ok", context do
      file = File.open!(context.temp_file, [:write])
      assert Newsletter.close_log(file) == :ok
    end

    @tag task_id: 4
    test "closes the file", context do
      file = File.open!(context.temp_file, [:read])
      assert Newsletter.close_log(file) == :ok
      assert IO.read(file, :all) == {:error, :terminated}
    end
  end

  describe "send_newsletter" do
    @tag task_id: 5
    test "returns ok", context do
      send_fun = fn _ -> :ok end

      assert Newsletter.send_newsletter(
               Path.join(["assets", "emails.txt"]),
               context.temp_file,
               send_fun
             ) == :ok
    end

    @tag task_id: 5
    test "calls send function for every email from the emails file", context do
      send_fun = fn email -> send(self(), {:send, email}) && :ok end

      Newsletter.send_newsletter(Path.join(["assets", "emails.txt"]), context.temp_file, send_fun)

      assert_received {:send, "alice@example.com"}
      assert_received {:send, "bob@example.com"}
      assert_received {:send, "charlie@example.com"}
      assert_received {:send, "dave@example.com"}
    end

    @tag task_id: 5
    test "logs emails that were sent", context do
      send_fun = fn _ -> :ok end

      Newsletter.send_newsletter(Path.join(["assets", "emails.txt"]), context.temp_file, send_fun)

      assert File.read!(context.temp_file) ==
               """
               alice@example.com
               bob@example.com
               charlie@example.com
               dave@example.com
               """
    end

    @tag task_id: 5
    test "does not log emails that could not be sent", context do
      send_fun = fn
        "bob@example.com" -> :error
        "charlie@example.com" -> :error
        _ -> :ok
      end

      Newsletter.send_newsletter(Path.join(["assets", "emails.txt"]), context.temp_file, send_fun)

      assert File.read!(context.temp_file) == """
             alice@example.com
             dave@example.com
             """
    end

    @tag task_id: 5
    test "sending the same newsletter twice resets the log", context do
      send_fun = fn _ -> :ok end
      Newsletter.send_newsletter(Path.join(["assets", "emails.txt"]), context.temp_file, send_fun)
      Newsletter.send_newsletter(Path.join(["assets", "emails.txt"]), context.temp_file, send_fun)

      assert File.read!(context.temp_file) ==
               """
               alice@example.com
               bob@example.com
               charlie@example.com
               dave@example.com
               """
    end

    @tag task_id: 5
    test "logs the email immediately after it was sent", context do
      send_fun = fn email ->
        case email do
          "alice@example.com" ->
            :ok

          "bob@example.com" ->
            assert File.read!(context.temp_file) == """
                   alice@example.com
                   """

            :ok

          "charlie@example.com" ->
            assert File.read!(context.temp_file) == """
                   alice@example.com
                   bob@example.com
                   """

            :error

          "dave@example.com" ->
            assert File.read!(context.temp_file) == """
                   alice@example.com
                   bob@example.com
                   """

            :ok
        end
      end

      Newsletter.send_newsletter(Path.join(["assets", "emails.txt"]), context.temp_file, send_fun)

      assert File.read!(context.temp_file) ==
               """
               alice@example.com
               bob@example.com
               dave@example.com
               """
    end
  end
end
