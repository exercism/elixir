defmodule FormTest do
  use ExUnit.Case

  # Dear Elixir learner,
  # If you're reading this test suite to gain some insights,
  # please be advised that it is somewhat unusual.
  #
  # Don't worry if you don't understand this test suite at this stage of your learning journey.
  # We had to use some advanced features to be able to write assertions about docs and typespecs.
  # You wouldn't normally write assertions for that in a typical codebase.
  # We're doing it here strictly for educational purposes.

  defmacrop assert_moduledoc(expected_moduledoc) do
    quote do
      {:docs_v1, _, _, _, module_doc, _, _} = Code.fetch_docs(Form)

      if module_doc == :none do
        flunk("expected the module Form to have documentation")
      else
        actual_moduledoc = module_doc["en"]
        assert actual_moduledoc == unquote(expected_moduledoc)
      end
    end
  end

  defmacrop assert_doc({function_name, function_arity}, expected_doc) do
    quote do
      {:docs_v1, _, _, _, _, _, docs} = Code.fetch_docs(Form)

      {_, _, _, doc_content, _} =
        Enum.find(docs, fn {{kind, function_name, arity}, _, _, _, _} ->
          {kind, function_name, arity} ==
            {:function, unquote(function_name), unquote(function_arity)}
        end)

      if doc_content == :none do
        flunk(
          "expected the function Form.#{unquote(function_name)}/#{unquote(function_arity)} to have documentation"
        )
      else
        actual_doc = doc_content["en"]
        assert actual_doc == unquote(expected_doc)
      end
    end
  end

  defmacrop assert_spec({function_name, function_arity}, arguments_specs, return_spec) do
    quote do
      {:ok, specs} = Code.Typespec.fetch_specs(Form)

      spec =
        Enum.find(specs, fn {{function_name, arity}, _} ->
          {function_name, arity} == {unquote(function_name), unquote(function_arity)}
        end)

      assert spec,
             "expected the function Form.#{unquote(function_name)}/#{unquote(function_arity)} to have a typespec"

      {{unquote(function_name), unquote(function_arity)}, [{:type, _, :fun, _} = function_spec]} =
        spec

      {:"::", _, [arguments, return]} =
        Code.Typespec.spec_to_quoted(unquote(function_name), function_spec)

      accepted_arguments_specs =
        Enum.map(unquote(arguments_specs), fn arguments_spec ->
          "#{unquote(function_name)}(#{arguments_spec})"
        end)

      actual_arguments_spec = Macro.to_string(arguments)
      assert actual_arguments_spec in accepted_arguments_specs

      expected_return_spec = unquote(return_spec)
      actual_return_spec = Macro.to_string(return)
      assert actual_return_spec == expected_return_spec
    end
  end

  defmacrop assert_type({module_name, type_name}, expected_type_definition) do
    quote do
      {:ok, types} = Code.Typespec.fetch_types(unquote(module_name))

      type =
        Enum.find(types, fn {declaration, {type_name, _, _}} ->
          declaration == :type && type_name == unquote(type_name)
        end)

      {:type, type} = type

      {:"::", _, [_, type_definition]} = Code.Typespec.type_to_quoted(type)

      assert type,
             "expected the module#{unquote(module_name)} to have a public type named #{unquote(type_name)}"

      actual_type_definition = Macro.to_string(type_definition)
      assert actual_type_definition == unquote(expected_type_definition)
    end
  end

  describe "the Form module" do
    @tag task_id: 1
    test "has documentation" do
      expected_moduledoc = """
      A collection of loosely related functions helpful for filling out various forms at the city office.
      """

      assert_moduledoc(expected_moduledoc)
    end
  end

  describe "blanks/1" do
    @tag task_id: 2
    test "returns a string with Xs of a given length" do
      assert Form.blanks(5) == "XXXXX"
    end

    @tag task_id: 2
    test "returns an empty string when given length is 0" do
      assert Form.blanks(0) == ""
    end

    @tag task_id: 2
    test "has documentation" do
      expected_doc = """
      Generates a string of a given length.

      This string can be used to fill out a form field that is supposed to have no value.
      Such fields cannot be left empty because a malicious third party could fill them out with false data.
      """

      assert_doc({:blanks, 1}, expected_doc)
    end

    @tag task_id: 2
    test "has a correct spec" do
      assert_spec({:blanks, 1}, ["n :: non_neg_integer()", "non_neg_integer()"], "String.t()")
    end
  end

  describe "letters/1" do
    @tag task_id: 3
    test "returns a list of upcase letters" do
      assert Form.letters("Sao Paulo") == ["S", "A", "O", " ", "P", "A", "U", "L", "O"]
    end

    @tag task_id: 3
    test "returns an empty list when given an empty string" do
      assert Form.letters("") == []
    end

    @tag task_id: 3
    test "has documentation" do
      expected_doc = """
      Splits the string into a list of uppercase letters.

      This is needed for form fields that don't offer a single input for the whole string,
      but instead require splitting the string into a predefined number of single-letter inputs.
      """

      assert_doc({:letters, 1}, expected_doc)
    end

    @tag task_id: 3
    test "has a typespec" do
      assert_spec({:letters, 1}, ["word :: String.t()", "String.t()"], "[String.t()]")
    end
  end

  describe "check_length/2" do
    @tag task_id: 4
    test "returns :ok is value is below max length" do
      assert Form.check_length("Ruiz", 6) == :ok
    end

    @tag task_id: 4
    test "returns :ok is value is of exactly max length" do
      assert Form.check_length("Martinez-Cooper", 15) == :ok
    end

    @tag task_id: 4
    test "returns an error tuple with the difference between max length and actual length" do
      assert Form.check_length("Martinez-Campbell", 10) == {:error, 7}
    end

    @tag task_id: 4
    test "has documentation" do
      expected_doc = """
      Checks if the value has no more than the maximum allowed number of letters.

      This is needed to check that the values of fields do not exceed the maximum allowed length.
      It also tells you by how much the value exceeds the maximum.
      """

      assert_doc({:check_length, 2}, expected_doc)
    end

    @tag task_id: 4
    test "has a typespec" do
      assert_spec(
        {:check_length, 2},
        ["word :: String.t(), length :: non_neg_integer()", "String.t(), non_neg_integer()"],
        ":ok | {:error, pos_integer()}"
      )
    end
  end

  describe "custom types in the Form module" do
    @tag task_id: 5
    test "has a custom 'address_map' type" do
      expected_type_definition =
        "%{street: String.t(), postal_code: String.t(), city: String.t()}"

      assert_type({Form, :address_map}, expected_type_definition)
    end

    @tag task_id: 5
    test "has a custom 'address_tuple' type with named arguments" do
      expected_type_definition =
        "{street :: String.t(), postal_code :: String.t(), city :: String.t()}"

      assert_type({Form, :address_tuple}, expected_type_definition)
    end

    @tag task_id: 5
    test "has a custom 'address' type that is a union of 'address_map' and 'address_tuple'" do
      expected_type_definition = "address_map() | address_tuple()"

      assert_type({Form, :address}, expected_type_definition)
    end
  end

  describe "format_address/1" do
    @tag task_id: 6
    test "accepts a map" do
      input = %{
        street: "Wiejska 4/6/8",
        postal_code: "00-902",
        city: "Warsaw"
      }

      result = """
      WIEJSKA 4/6/8
      00-902 WARSAW
      """

      assert Form.format_address(input) == result
    end

    @tag task_id: 6
    test "accepts a 3 string tuple" do
      result = """
      PLATZ DER REPUBLIK 1
      11011 BERLIN
      """

      assert Form.format_address({"Platz der Republik 1", "11011", "Berlin"}) == result
    end

    @tag task_id: 6
    test "has documentation" do
      expected_doc = """
      Formats the address as an uppercase multiline string.
      """

      assert_doc({:format_address, 1}, expected_doc)
    end

    @tag task_id: 6
    test "has a typespec" do
      assert_spec({:format_address, 1}, ["address :: address()", "address()"], "String.t()")
    end
  end
end
