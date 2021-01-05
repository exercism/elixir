defmodule Newsletter do
  def read_emails(path) do
    raise "Please implement the read_emails/1 function"
  end

  def open_log(path) do
    raise "Please implement the open_log/1 function"
  end

  def log_sent_email(pid, email) do
    raise "Please implement the log_sent_email/2 function"
  end

  def close_log(pid) do
    raise "Please implement the close_log/1 function"
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    raise "Please implement the send_newsletter/3 function"
  end
end
