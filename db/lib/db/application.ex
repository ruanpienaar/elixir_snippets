defmodule Db.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Db.Worker.start_link(arg)
      # {Db.Worker, arg}
      Db.Postgres.Repo,
    ]
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Db.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
