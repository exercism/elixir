ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true, seed: 0)
ExUnit.after_suite(fn _ -> File.rm("filename") end)
