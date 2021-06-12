Mix.install([
  {:jason, "~> 1.2"}
])

{opts, _} = OptionParser.parse!(
  System.argv(),
  [strict: [verbose: :boolean, no_warn: :boolean], aliases: [v: :verbose]]
)

concept_practices_exercise_limit = 10

config =
  "./config.json"
  |> File.read!()
  |> Jason.decode!()

concept_slugs =
  config["concepts"]
  |> Enum.map(& &1["slug"])
  |> Enum.sort()

print_exercises =
  fn exercises ->
    exercises =
      exercises
      |> Enum.map(& &1["slug"])
      |> Enum.sort()
      |> Enum.join(", ")

    IO.write("[#{exercises}]")
  end

analyze_concept =
  fn concept_slug ->
    {practiced_by, required_by} =
      config["exercises"]["practice"]
      |> Enum.reduce({[], []}, fn exercise, {practiced_by_acc, required_by_acc} ->
        practiced_by_acc =
          if concept_slug in exercise["practices"] do
            [exercise | practiced_by_acc]
          else
            practiced_by_acc
          end

        required_by_acc =
          if concept_slug in exercise["prerequisites"] do
            [exercise | required_by_acc]
          else
            required_by_acc
          end

        {practiced_by_acc, required_by_acc}
      end)

    not_practiced = practiced_by == []
    not_required = required_by == []
    practiced_too_often = Enum.count(practiced_by) > concept_practices_exercise_limit

    status =
      cond do
        practiced_too_often -> :error
        not_required || not_practiced -> :warn
        true -> :ok
      end

    IO.write(concept_slug <> " ")

    cond do
      status == :error ->
        IO.write("#{IO.ANSI.red()}⨯#{IO.ANSI.reset()}\n")

        if practiced_too_often do
          IO.write("  Too many exercises practice this concept.\n")
        end

      status == :warn && !opts[:no_warn] ->
        IO.write("#{IO.ANSI.yellow()}●#{IO.ANSI.reset()}\n")

        if not_practiced do
          IO.write("  This concept is not practiced by any exercise.\n")
        end

        if not_required do
          IO.write("  This concept is not required by any exercise.\n")
        end

      status == :ok || (status == :warn && opts[:no_warn]) ->
        IO.write("#{IO.ANSI.green()}✔#{IO.ANSI.reset()}\n")
    end

    if practiced_too_often || opts[:verbose] do
      IO.write("  Practiced by (#{Enum.count(practiced_by)}): ")
      print_exercises.(practiced_by)
      IO.write("\n")
    end

    if opts[:verbose] do
      IO.write("  Required by (#{Enum.count(required_by)}): ")
      print_exercises.(required_by)
      IO.write("\n")
    end

    IO.write("\n")

    status
  end

{errors, warnings} =
  Enum.reduce(concept_slugs, {[], []}, fn concept_slug, {errors, warnings} ->
    status = analyze_concept.(concept_slug)

    case status do
      :error ->
        {[concept_slug | errors], warnings}

      :warn ->
        {errors, [concept_slug | warnings]}

      :ok ->
        {errors, warnings}
    end
  end)

IO.write("\nFinished concept check: #{IO.ANSI.red()}#{Enum.count(errors)} errors#{IO.ANSI.reset()} and #{IO.ANSI.yellow()}#{Enum.count(warnings)} warnings#{IO.ANSI.reset()}\n")

if errors != [] do
  exit(1)
end
