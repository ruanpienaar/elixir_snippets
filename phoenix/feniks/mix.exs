defmodule Feniks.MixProject do
use Mix.Project

  def project do
    [
      app: :feniks,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Feniks.Application, []},
      extra_applications: [:logger, :runtime_tools, :wx, :observer]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.7.12"}
    ]
  end
end
