defmodule LogParserTest do
  use ExUnit.Case

  describe "valid_line?/1" do
    @tag task_id: 1
    test "valid DEBUG message" do
      assert LogParser.valid_line?("[DEBUG] response time 3ms") == true
    end

    @tag task_id: 1
    test "valid INFO message" do
      assert LogParser.valid_line?("[INFO] the latest information") == true
    end

    @tag task_id: 1
    test "valid WARNING message" do
      assert LogParser.valid_line?("[WARNING] something might be wrong") == true
    end

    @tag task_id: 1
    test "valid ERROR message" do
      assert LogParser.valid_line?("[ERROR] something really bad happened") == true
    end

    @tag task_id: 1
    test "unknown level" do
      assert LogParser.valid_line?("[BOB] something really bad happened") == false
    end

    @tag task_id: 1
    test "line must start with level" do
      assert LogParser.valid_line?("bad start [DEBUG] ") == false
    end

    @tag task_id: 1
    test "level must be wrapped in square brackets" do
      assert LogParser.valid_line?("ERROR something really bad happened") == false
      assert LogParser.valid_line?("[INFO the latest information") == false
      assert LogParser.valid_line?("DEBUG] response time 3ms") == false
    end

    @tag task_id: 1
    test "level must be uppercase" do
      assert LogParser.valid_line?("[warning] something might be wrong") == false
    end
  end

  describe "split_line/1" do
    @tag task_id: 2
    test "splits into three sections" do
      assert LogParser.split_line("[INFO] Start.<*>[INFO] Processing...<~~~>[INFO] Success.") == [
               "[INFO] Start.",
               "[INFO] Processing...",
               "[INFO] Success."
             ]
    end

    @tag task_id: 2
    test "symbols =, ~, *, and - can be freely mixed" do
      assert LogParser.split_line(
               "[DEBUG] Attempt nr 2<=>[DEBUG] Attempt nr 3<-*~*->[ERROR] Failed to send SMS."
             ) == [
               "[DEBUG] Attempt nr 2",
               "[DEBUG] Attempt nr 3",
               "[ERROR] Failed to send SMS."
             ]
    end

    @tag task_id: 2
    test "symbols other than =, ~, *, or - do not split" do
      assert LogParser.split_line(
               "[INFO] Attempt nr 1<=!>[INFO] Attempt nr 2< >[INFO] Attempt nr 3"
             ) == [
               "[INFO] Attempt nr 1<=!>[INFO] Attempt nr 2< >[INFO] Attempt nr 3"
             ]
    end

    @tag task_id: 2
    test "symbols between angular brackets aren't required" do
      assert LogParser.split_line("[INFO] Attempt nr 1<>[INFO] Attempt nr 2") == [
               "[INFO] Attempt nr 1",
               "[INFO] Attempt nr 2"
             ]
    end

    @tag task_id: 2
    test "angular brackets are required" do
      assert LogParser.split_line("[ERROR] Failed to send SMS**[ERROR] Invalid API key.") == [
               "[ERROR] Failed to send SMS**[ERROR] Invalid API key."
             ]
    end

    @tag task_id: 2
    test "angular brackets must be closed required" do
      assert LogParser.split_line("[ERROR] Failed to send SMS<**[ERROR] Invalid API key.") == [
               "[ERROR] Failed to send SMS<**[ERROR] Invalid API key."
             ]
    end
  end

  describe "remove_artifacts/1" do
    @tag task_id: 3
    test "removes a single 'end-of-line' followed by a line number" do
      assert LogParser.remove_artifacts("[WARNING] Network Failure end-of-line27") ==
               "[WARNING] Network Failure "
    end

    @tag task_id: 3
    test "leaves other lines unchanged" do
      assert LogParser.remove_artifacts("[DEBUG] Process started") ==
               "[DEBUG] Process started"
    end

    @tag task_id: 3
    test "removes multiple 'end-of-line's followed by line numbers" do
      assert LogParser.remove_artifacts(
               "[WARNING] end-of-line23033 Network Failure end-of-line27"
             ) == "[WARNING]  Network Failure "
    end

    @tag task_id: 3
    test "removes 'end-of-line' and line numbers even when not separated form the rest of the log by a space" do
      assert LogParser.remove_artifacts("[WARNING]end-of-line23033Network Failureend-of-line27") ==
               "[WARNING]Network Failure"
    end

    @tag task_id: 3
    test "does not remove 'end-of-line' if not followed by a line number" do
      assert LogParser.remove_artifacts("[INFO] end-of-line User disconnected end-of-lineXYZ") ==
               "[INFO] end-of-line User disconnected end-of-lineXYZ"
    end

    @tag task_id: 3
    test "does not remove 'end-of-line' if a number is separated by a space" do
      assert LogParser.remove_artifacts("[DEBUG] Query runtime:end-of-line 6ms") ==
               "[DEBUG] Query runtime:end-of-line 6ms"
    end

    @tag task_id: 3
    test "is case-insensitive" do
      assert LogParser.remove_artifacts("[DEBUG] END-of-LINE77 Process started End-Of-Line09") ==
               "[DEBUG]  Process started "
    end
  end

  describe "tag_with_user_name/1" do
    @tag task_id: 4
    test "extracts user name and appends it to the line" do
      assert LogParser.tag_with_user_name("[WARN] User James123 has exceeded storage space") ==
               "[USER] James123 [WARN] User James123 has exceeded storage space"
    end

    @tag task_id: 4
    test "leaves other lines unchanged" do
      assert LogParser.tag_with_user_name("[DEBUG] Process started") ==
               "[DEBUG] Process started"
    end

    @tag task_id: 4
    test "multiple spaces can appear after the word 'User'" do
      assert LogParser.tag_with_user_name("[INFO] User   Bob9 reported post fxa3qa") ==
               "[USER] Bob9 [INFO] User   Bob9 reported post fxa3qa"
    end

    @tag task_id: 4
    test "user name can be delimited by tabs" do
      assert LogParser.tag_with_user_name(
               "[ERROR] User\t!!!\tdoes not have a valid payment method"
             ) ==
               "[USER] !!! [ERROR] User\t!!!\tdoes not have a valid payment method"
    end

    @tag task_id: 4
    test "user name can be delimited by new lines" do
      assert LogParser.tag_with_user_name("[DEBUG] Created User\nAlice908101\nat 14:02") ==
               "[USER] Alice908101 [DEBUG] Created User\nAlice908101\nat 14:02"
    end

    @tag task_id: 4
    test "user name can end with the end of the line" do
      assert LogParser.tag_with_user_name("[INFO] New log in for User __JOHNNY__") ==
               "[USER] __JOHNNY__ [INFO] New log in for User __JOHNNY__"
    end

    @tag task_id: 4
    test "works for Ukrainian user names with emoji" do
      assert LogParser.tag_with_user_name("[INFO] Promoted User АНАСТАСІЯ_🙂 to admin") ==
               "[USER] АНАСТАСІЯ_🙂 [INFO] Promoted User АНАСТАСІЯ_🙂 to admin"
    end
  end
end
