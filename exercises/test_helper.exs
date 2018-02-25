"exercises/**/example.exs"
|> Path.wildcard()
|> Kernel.ParallelRequire.files()

System.put_env("EXERCISM_TEST_EXAMPLES", "true")
ExUnit.configure(include: :pending)
ExUnit.start()
