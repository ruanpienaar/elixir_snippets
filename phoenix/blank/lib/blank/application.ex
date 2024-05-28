defmodule Blank.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BlankWeb.Telemetry,
      Blank.Repo,
      {DNSCluster, query: Application.get_env(:blank, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Blank.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Blank.Finch},
      # Start a worker by calling: Blank.Worker.start_link(arg)
      # {Blank.Worker, arg},
      # Start to serve requests, typically the last entry
      BlankWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Blank.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BlankWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
