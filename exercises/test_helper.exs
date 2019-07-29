"exercises/**/example.exs"
|> Path.wildcard()
|> Kernel.ParallelCompiler.require()

System.put_env("EXERCISM_TEST_EXAMPLES", "true")
ExUnit.configure(include: :pending)
ExUnit.start()
