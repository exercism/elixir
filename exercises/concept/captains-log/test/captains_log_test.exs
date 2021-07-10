defmodule CaptainsLogTest do
  use ExUnit.Case

  describe "random_planet_class" do
    @tag task_id: 1
    test "it always returns one of the letters: D, H, J, K, L, M, N, R, T, Y" do
      planetary_classes = ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

      Enum.each(0..100, fn _ ->
        assert CaptainsLog.random_planet_class() in planetary_classes
      end)
    end

    @tag task_id: 1
    test "it will eventually return each of the letters at least once" do
      planetary_classes = ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

      never_returned_planetary_classes =
        Enum.reduce_while(0..1000, planetary_classes, fn _, remaining_planetary_classes ->
          if remaining_planetary_classes == [] do
            {:halt, remaining_planetary_classes}
          else
            {:cont, remaining_planetary_classes -- [CaptainsLog.random_planet_class()]}
          end
        end)

      assert never_returned_planetary_classes == []
    end
  end

  describe "random_ship_registry_number" do
    @tag task_id: 2
    test "start with \"NCC-\"" do
      assert String.starts_with?(CaptainsLog.random_ship_registry_number(), "NCC-")
    end

    @tag task_id: 2
    test "ends with a random integer between 1000 and 9999" do
      Enum.each(0..100, fn _ ->
        random_ship_registry_number = CaptainsLog.random_ship_registry_number()
        just_the_number = String.replace(random_ship_registry_number, "NCC-", "")

        case Integer.parse(just_the_number) do
          {integer, ""} ->
            assert integer >= 1000
            assert integer <= 9999

          _ ->
            flunk("Expected #{just_the_number} to be an integer")
        end
      end)
    end
  end

  describe "random_stardate" do
    @tag task_id: 3
    test "is a float" do
      assert is_float(CaptainsLog.random_stardate())
    end

    @tag task_id: 3
    test "is equal to or greater than 41_000.0" do
      Enum.each(0..100, fn _ ->
        assert CaptainsLog.random_stardate() >= 41_000.0
      end)
    end

    @tag task_id: 3
    test "is less than 42_000.0" do
      Enum.each(0..100, fn _ ->
        assert CaptainsLog.random_stardate() < 42_000.0
      end)
    end

    @tag task_id: 3
    test "consecutive calls return floats with different fractional parts" do
      decimal_parts =
        Enum.map(0..10, fn _ ->
          random_stardate = CaptainsLog.random_stardate()
          Float.ceil(random_stardate) - random_stardate
        end)

      assert Enum.count(Enum.uniq(decimal_parts)) > 3
    end

    @tag task_id: 3
    test "returns floats with fractional parts with more than one decimal place" do
      decimal_parts =
        Enum.map(0..10, fn _ ->
          random_stardate = CaptainsLog.random_stardate()
          Float.ceil(random_stardate * 10) - random_stardate * 10
        end)

      assert Enum.count(Enum.uniq(decimal_parts)) > 3
    end
  end

  describe "format_stardate" do
    @tag task_id: 4
    test "returns a string" do
      assert is_bitstring(CaptainsLog.format_stardate(41010.7))
    end

    @tag task_id: 4
    test "formats floats" do
      assert CaptainsLog.format_stardate(41543.3) == "41543.3"
    end

    @tag task_id: 4
    test "rounds floats to one decimal place" do
      assert CaptainsLog.format_stardate(41032.4512) == "41032.5"
    end

    @tag task_id: 4
    test "does not accept integers" do
      assert_raise ArgumentError, fn -> CaptainsLog.format_stardate(41411) end
    end
  end
end
