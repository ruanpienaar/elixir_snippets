defmodule Db.MixProject do
  use Mix.Project

  def project do
    [
      app: :db,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [
        :logger,
        :runtime_tools,
        :wx,
        :observer
      ],
      mod: {Db.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:jason, "~> 1.0"}, # >= 1.0.0 and < 1.1.0
      {:ecto, "~> 3.10"}, # >= 3.10.0 and < 3.11.0
      {:ecto_sql, "~> 3.10"}, # >= 3.10.0 and < 3.11.0
      {:postgrex, "== 0.17.5"}
    ]
  end
end
