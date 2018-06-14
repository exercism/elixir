[Elixir](http://elixir-lang.org/), initially released in 2012, extends upon the already robust features of Erlang while also being easier for beginners to access, read, test, and write.

José Valim, the creator of Elixir, explains [here](https://vimeo.com/53221562) how he built the language for applications to be:

  1. Distributed
  2. Fault-Tolerant
  3. Soft-Real-Time
  4. Hot-Code-Swapped (can introduce new code without stopping the server)

Elixir actually compiles down to [bytecode](https://en.wikipedia.org/wiki/Bytecode) and then runs on the [BEAM Erlang Virtual Machine](http://erlangcentral.org/videos/euc-2014-robert-virding-hitchhikers-tour-of-the-beam/).

There is no "conversion cost" for calling Erlang, meaning you can run Erlang code right next to Elixir code.

Being a functional language, everything in Elixir is an expression.

Elixir has "First Class Documentation" meaning comments  can be attached to a function, making it easier to retrieve.

Regular expressions are also given first class treatment, removing awkward escaping within strings.

Elixir's asynchronous communication implementation allows the code to be lightweight, yet incorporate high-volume concurrency.

Programmers use Elixir to handle thousands of requests and responses *concurrently* on a single server node.

It has been used successfully for microservices that need to consume and serve a multitude of APIs rapidly.

The [Phoenix framework](http://www.phoenixframework.org/) helps structure Elixir applications for the web.
