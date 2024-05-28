defmodule Feniks.Supervisor do

  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, [strategy: :one_for_one], name: __MODULE__)
  end

  def init(_initargs) do
    children = [
      # Feniks.Endpoint

    ]
    Supervisor.init(children, strategy: :one_for_one)
  end

  # TODO: Add add_child()

end
