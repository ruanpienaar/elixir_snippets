defmodule Feniks.MixProject do
  use Mix.Project

  def project do
    [
      app: :feniks,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Feniks.Application, []},
      extra_applications: [:logger, :runtime_tools, :wx, :observer]
    ]
  end

  # DEPS
  # {:crypto, ~c"CRYPTO", ~c"5.4.2"},
  # {:asn1, ~c"The Erlang ASN1 compiler version 5.2.2", ~c"5.2.2"},
  # {:phoenix_pubsub, ~c"Distributed PubSub and Presence platform", ~c"2.1.3"},
  # {:kernel, ~c"ERTS  CXC 138 10", ~c"9.2.4"},
  # {:phoenix_template, ~c"Template rendering for Phoenix", ~c"1.0.4"},
  # {:phoenix, ~c"Peace of mind from prototype to production", ~c"1.7.12"},
  # {:websock, ~c"A specification for WebSocket connections", ~c"0.5.3"},
  # {:hex, ~c"hex", ~c"2.0.6"},
  # {:plug_crypto, ~c"Crypto-related functionality for the web", ~c"2.1.0"},
  # {:runtime_tools, ~c"RUNTIME_TOOLS", ~c"2.0.1"},
  # {:wx, ~c"Yet another graphics system", ~c"2.4.1"},
  # {:observer, ~c"OBSERVER version 1", ~c"2.15.1"},
  # {:websock_adapter, ~c"A set of WebSock adapters for common web servers", ~c"0.5.6"},
  # {:elixir, ~c"elixir", ~c"1.16.2"},
  # {:mix, ~c"mix", ~c"1.16.2"},
  # {:castore, ~c"Up-to-date CA certificate store.", ~c"1.0.7"},
  # {:telemetry, ~c"Dynamic dispatching library for metrics and instrumentations",  ~c"1.2.1"},
  # {:ex_unit, ~c"ex_unit", ~c"1.16.2"},
  # {:compiler, ~c"ERTS  CXC 138 10", ~c"8.4.3"},
  # {:mime, ~c"A MIME type module for Elixir", ~c"2.0.5"},
  # {:logger, ~c"logger", ~c"1.16.2"},
  # {:plug, ~c"Compose web applications with functions", ~c"1.15.3"},
  # {:iex, ~c"iex", ~c"1.16.2"},
  # {:public_key, ~c"Public key infrastructure", ~c"1.15.1"},
  # {:feniks, ~c"feniks", ~c"0.1.0"},
  # {:ssl, ~c"Erlang/OTP SSL application", ~c"11.1.4"},
  # {:stdlib, ~c"ERTS  CXC 138 10", ~c"5.2.3"},
  # {:eex, ~c"eex", ~c"1.16.2"},
  # {:inets, ~c"INETS  CXC 138 49", ~c"9.1"}

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.7.12"},
      {:phoenix_live_view, "~> 0.20.2"},
      {:bandit, "~> 1.2"},
      {:telemetry_metrics, "~> 1.0"},
      {:telemetry_poller, "~> 1.0"},
      {:telemetry_metrics_prometheus, "~> 1.1.0"},
      {:jason, "~> 1.2"},
      {:gettext, "~> 0.20"}
    ]
  end
end
