defmodule RestApiTest do
  use ExUnit.Case

  describe "user management" do
    # @tag :pending
    test "no users" do
      database = []
      {:ok, api} = RestApi.init(database)

      payload = ""
      output = RestApi.get(api, "/users", payload)
      expected = "{\"users\":[]}"

      assert output == expected
    end

    @tag :pending
    test "add user" do
      database = []
      {:ok, api} = RestApi.init(database)

      payload = "{\"user\":\"Adam\"}"
      output = RestApi.post(api, "/add", payload)
      expected = "{\"balance\":0,\"name\":\"Adam\",\"owed_by\":{},\"owes\":{}}"

      assert output == expected
    end

    @tag :pending
    test "get single user" do
      database = [
        %{balance: 0, name: "Adam", owed_by: %{}, owes: %{}},
        %{balance: 0, name: "Bob", owed_by: %{}, owes: %{}}
      ]

      {:ok, api} = RestApi.init(database)

      payload = "{\"users\":[\"Bob\"]}"
      output = RestApi.get(api, "/users", payload)

      expected = "{\"users\":[{\"balance\":0,\"name\":\"Bob\",\"owed_by\":{},\"owes\":{}}]}"

      assert output == expected
    end
  end

  describe "/iou" do
    @tag :pending
    test "both users have 0 balance" do
      database = [
        %{balance: 0, name: "Adam", owed_by: %{}, owes: %{}},
        %{balance: 0, name: "Bob", owed_by: %{}, owes: %{}}
      ]

      {:ok, api} = RestApi.init(database)

      payload = "{\"amount\":3,\"borrower\":\"Bob\",\"lender\":\"Adam\"}"
      output = RestApi.post(api, "/iou", payload)

      expected =
        "{\"users\":[{\"balance\":3,\"name\":\"Adam\",\"owed_by\":{\"Bob\":3},\"owes\":{}},{\"balance\":-3,\"name\":\"Bob\",\"owed_by\":{},\"owes\":{\"Adam\":3}}]}"

      assert output == expected
    end

    @tag :pending
    test "borrower has negative balance" do
      database = [
        %{balance: 0, name: "Adam", owed_by: %{}, owes: %{}},
        %{balance: -3, name: "Bob", owed_by: %{}, owes: %{"Chuck" => 3}},
        %{balance: 3, name: "Chuck", owed_by: %{"Bob" => 3}, owes: %{}}
      ]

      {:ok, api} = RestApi.init(database)

      payload = "{\"amount\":3,\"borrower\":\"Bob\",\"lender\":\"Adam\"}"
      output = RestApi.post(api, "/iou", payload)

      expected =
        "{\"users\":[{\"balance\":3,\"name\":\"Adam\",\"owed_by\":{\"Bob\":3},\"owes\":{}},{\"balance\":-6,\"name\":\"Bob\",\"owed_by\":{},\"owes\":{\"Adam\":3,\"Chuck\":3}}]}"

      assert output == expected
    end

    @tag :pending
    test "lender has negative balance" do
      database = [
        %{balance: 0, name: "Adam", owed_by: %{}, owes: %{}},
        %{balance: -3, name: "Bob", owed_by: %{}, owes: %{"Chuck" => 3}},
        %{balance: 3, name: "Chuck", owed_by: %{"Bob" => 3}, owes: %{}}
      ]

      {:ok, api} = RestApi.init(database)

      payload = "{\"amount\":3,\"borrower\":\"Adam\",\"lender\":\"Bob\"}"
      output = RestApi.post(api, "/iou", payload)

      expected =
        "{\"users\":[{\"balance\":-3,\"name\":\"Adam\",\"owed_by\":{},\"owes\":{\"Bob\":3}},{\"balance\":0,\"name\":\"Bob\",\"owed_by\":{\"Adam\":3},\"owes\":{\"Chuck\":3}}]}"

      assert output == expected
    end

    @tag :pending
    test "lender owes borrower" do
      database = [
        %{balance: -3, name: "Adam", owed_by: %{}, owes: %{"Bob" => 3}},
        %{balance: 3, name: "Bob", owed_by: %{"Adam" => 3}, owes: %{}}
      ]

      {:ok, api} = RestApi.init(database)

      payload = "{\"amount\":2,\"borrower\":\"Bob\",\"lender\":\"Adam\"}"
      output = RestApi.post(api, "/iou", payload)

      expected =
        "{\"users\":[{\"balance\":-1,\"name\":\"Adam\",\"owed_by\":{},\"owes\":{\"Bob\":1}},{\"balance\":1,\"name\":\"Bob\",\"owed_by\":{\"Adam\":1},\"owes\":{}}]}"

      assert output == expected
    end

    @tag :pending
    test "lender owes borrower less than new loan" do
      database = [
        %{balance: -3, name: "Adam", owed_by: %{}, owes: %{"Bob" => 3}},
        %{balance: 3, name: "Bob", owed_by: %{"Adam" => 3}, owes: %{}}
      ]

      {:ok, api} = RestApi.init(database)

      payload = "{\"amount\":4,\"borrower\":\"Bob\",\"lender\":\"Adam\"}"
      output = RestApi.post(api, "/iou", payload)

      expected =
        "{\"users\":[{\"balance\":1,\"name\":\"Adam\",\"owed_by\":{\"Bob\":1},\"owes\":{}},{\"balance\":-1,\"name\":\"Bob\",\"owed_by\":{},\"owes\":{\"Adam\":1}}]}"

      assert output == expected
    end

    @tag :pending
    test "lender owes borrower same as new loan" do
      database = [
        %{balance: -3, name: "Adam", owed_by: %{}, owes: %{"Bob" => 3}},
        %{balance: 3, name: "Bob", owed_by: %{"Adam" => 3}, owes: %{}}
      ]

      {:ok, api} = RestApi.init(database)

      payload = "{\"amount\":3,\"borrower\":\"Bob\",\"lender\":\"Adam\"}"
      output = RestApi.post(api, "/iou", payload)

      expected =
        "{\"users\":[{\"balance\":0,\"name\":\"Adam\",\"owed_by\":{},\"owes\":{}},{\"balance\":0,\"name\":\"Bob\",\"owed_by\":{},\"owes\":{}}]}"

      assert output == expected
    end

    @tag :pending
    test "borrower borrows three times different amounts" do
      database = [
        %{balance: 0, name: "Adam", owed_by: %{}, owes: %{}},
        %{balance: 0, name: "Bob", owed_by: %{}, owes: %{}}
      ]

      {:ok, api} = RestApi.init(database)

      payload = "{\"amount\":1,\"borrower\":\"Bob\",\"lender\":\"Adam\"}"
      RestApi.post(api, "/iou", payload)
      payload = "{\"amount\":2,\"borrower\":\"Bob\",\"lender\":\"Adam\"}"
      RestApi.post(api, "/iou", payload)
      payload = "{\"amount\":3,\"borrower\":\"Bob\",\"lender\":\"Adam\"}"
      output = RestApi.post(api, "/iou", payload)

      expected =
        "{\"users\":[{\"balance\":6,\"name\":\"Adam\",\"owed_by\":{\"Bob\":6},\"owes\":{}},{\"balance\":-6,\"name\":\"Bob\",\"owed_by\":{},\"owes\":{\"Adam\":6}}]}"

      assert output == expected
    end

    @tag :pending
    test "borrower borrows three times the same amount" do
      database = [
        %{balance: 0, name: "Adam", owed_by: %{}, owes: %{}},
        %{balance: 0, name: "Bob", owed_by: %{}, owes: %{}}
      ]

      {:ok, api} = RestApi.init(database)

      payload = "{\"amount\":3,\"borrower\":\"Bob\",\"lender\":\"Adam\"}"
      RestApi.post(api, "/iou", payload)
      RestApi.post(api, "/iou", payload)
      output = RestApi.post(api, "/iou", payload)

      expected =
        "{\"users\":[{\"balance\":9,\"name\":\"Adam\",\"owed_by\":{\"Bob\":9},\"owes\":{}},{\"balance\":-9,\"name\":\"Bob\",\"owed_by\":{},\"owes\":{\"Adam\":9}}]}"

      assert output == expected
    end
  end
end
