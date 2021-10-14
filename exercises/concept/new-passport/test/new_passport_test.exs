defmodule NewPassportTest do
  use ExUnit.Case

  describe "getting into the building" do
    @tag task_id: 1
    test "building is closed in the morning" do
      assert NewPassport.get_new_passport(~N[2021-10-11 10:30:00], ~D[1984-09-14], :blue) ==
               {:error, "city office is closed"}
    end

    @tag task_id: 1
    test "building is closed early on Friday afternoon" do
      assert NewPassport.get_new_passport(~N[2021-10-08 15:00:00], ~D[1984-09-14], :blue) ==
               {:error, "city office is closed"}
    end

    @tag task_id: 1
    test "entering during business hour" do
      assert {:ok, _} =
               NewPassport.get_new_passport(~N[2021-10-11 15:00:00], ~D[1984-09-14], :blue)
    end
  end

  describe "find the right counter" do
    @tag task_id: 2
    test "information staff on coffee break" do
      assert NewPassport.get_new_passport(~N[2021-10-11 14:10:00], ~D[1984-09-14], :blue) ==
               {:retry, ~N[2021-10-11 14:25:00]}
    end

    @tag task_id: 2
    test "information staff on coffee break, retry at given time" do
      assert {:ok, _} =
               NewPassport.get_new_passport(~N[2021-10-11 14:25:00], ~D[1984-09-14], :blue)
    end

    @tag task_id: 2
    test "information staff on coffee break on Friday 15 minutes before closing time" do
      assert NewPassport.get_new_passport(~N[2021-10-08 14:15:00], ~D[1984-09-14], :blue) ==
               {:retry, ~N[2021-10-08 14:30:00]}
    end

    @tag task_id: 2
    test "retry after previous attempt, hit closing time" do
      assert NewPassport.get_new_passport(~N[2021-10-08 14:30:00], ~D[1984-09-14], :blue) ==
               {:error, "city office is closed"}
    end
  end

  describe "get the passport form stamped" do
    @tag task_id: 3
    test "illegal form color" do
      assert NewPassport.get_new_passport(
               ~N[2021-10-11 14:25:00],
               ~D[1984-09-14],
               :orange_and_purple
             ) == {:error, "wrong form color"}
    end

    @tag task_id: 3
    test "wrong form color" do
      assert NewPassport.get_new_passport(~N[2021-10-11 14:25:00], ~D[1984-09-14], :red) ==
               {:error, "wrong form color"}
    end

    @tag task_id: 3
    test "correct form color" do
      assert {:ok, _} =
               NewPassport.get_new_passport(~N[2021-10-11 14:25:00], ~D[1984-09-14], :blue)
    end
  end

  describe "receive the new passport number" do
    @tag task_id: 4
    test "get the right timestamp" do
      assert {:ok, passport_number} =
               NewPassport.get_new_passport(~N[2021-10-11 13:00:00], ~D[1984-09-14], :blue)

      [timestamp, _counter, _checksum] = String.split(passport_number, "-")
      assert timestamp == "1633957200"
    end

    @tag task_id: 4
    test "get the right timestamp after waiting for coffee break" do
      assert NewPassport.get_new_passport(~N[2021-10-11 14:15:00], ~D[1984-09-14], :blue) ==
               {:retry, ~N[2021-10-11 14:30:00]}

      assert {:ok, passport_number} =
               NewPassport.get_new_passport(~N[2021-10-11 14:30:00], ~D[1984-09-14], :blue)

      [timestamp, _counter, _checksum] = String.split(passport_number, "-")
      assert timestamp == "1633962600"
    end

    @tag task_id: 4
    test "get the right timestamp after waiting twice for coffee break" do
      assert NewPassport.get_new_passport(~N[2021-10-11 14:00:00], ~D[1984-09-14], :blue) ==
               {:retry, ~N[2021-10-11 14:15:00]}

      assert NewPassport.get_new_passport(~N[2021-10-11 14:15:00], ~D[1984-09-14], :blue) ==
               {:retry, ~N[2021-10-11 14:30:00]}

      assert {:ok, passport_number} =
               NewPassport.get_new_passport(~N[2021-10-11 14:30:00], ~D[1984-09-14], :blue)

      [timestamp, _counter, _checksum] = String.split(passport_number, "-")
      assert timestamp == "1633962600"
    end

    @tag task_id: 4
    test "16 year old finds the right counter" do
      assert {:ok, passport_number} =
               NewPassport.get_new_passport(~N[2021-10-11 14:30:00], ~D[2005-09-14], :blue)

      [_timestamp, counter, _checksum] = String.split(passport_number, "-")
      assert counter == "1"
    end

    @tag task_id: 4
    test "34 year old finds the right counter" do
      assert {:ok, passport_number} =
               NewPassport.get_new_passport(~N[2021-10-11 14:30:00], ~D[1987-09-14], :red)

      [_timestamp, counter, _checksum] = String.split(passport_number, "-")
      assert counter == "2"
    end

    @tag task_id: 4
    test "get the right passport number" do
      assert NewPassport.get_new_passport(~N[2021-10-11 15:00:00], ~D[1984-09-14], :blue) ==
               {:ok, "1633964400-3-4901893210"}
    end

    @tag task_id: 4
    test "get a passport number after waiting for a coffee break" do
      assert NewPassport.get_new_passport(~N[2021-10-11 14:15:00], ~D[1984-09-14], :blue) ==
               {:retry, ~N[2021-10-11 14:30:00]}

      assert NewPassport.get_new_passport(~N[2021-10-11 14:30:00], ~D[1984-09-14], :blue) ==
               {:ok, "1633962600-3-4901887810"}
    end

    @tag task_id: 4
    test "get a passport number after two coffee breaks" do
      assert NewPassport.get_new_passport(~N[2021-10-11 14:00:00], ~D[1964-09-14], :red) ==
               {:retry, ~N[2021-10-11 14:15:00]}

      assert NewPassport.get_new_passport(~N[2021-10-11 14:15:00], ~D[1964-09-14], :red) ==
               {:retry, ~N[2021-10-11 14:30:00]}

      assert NewPassport.get_new_passport(~N[2021-10-12 14:30:00], ~D[1964-09-14], :red) ==
               {:ok, "1634049000-4-817024502"}
    end
  end
end
