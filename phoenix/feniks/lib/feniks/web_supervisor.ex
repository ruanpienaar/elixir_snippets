defmodule Feniks.WebSupervisor do
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(
      __MODULE__,
      [strategy: :one_for_one],
      name: __MODULE__
    )
  end

  def init(_initargs) do
    children = [
      Feniks.Telemetry,
      # FeniksWeb.Repo
      # DnsCluster
      {Phoenix.PubSub, name: Feniks.PubSub},
      # finch
      FeniksWeb.Endpoint
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

end
