defmodule Crell.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CrellWeb.Telemetry,
      Crell.Repo,
      {DNSCluster, query: Application.get_env(:crell, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Crell.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Crell.Finch},
      # Start a worker by calling: Crell.Worker.start_link(arg)
      # {Crell.Worker, arg},
      # Start to serve requests, typically the last entry
      CrellWeb.Endpoint,
      %{
        :id => :startup,
        :start => {Crell.Startup, :startup, []},
        :restart => :temporary,
        :type => :worker
      }
    ]



    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Crell.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CrellWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
