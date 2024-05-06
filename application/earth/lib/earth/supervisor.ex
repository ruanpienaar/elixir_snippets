defmodule Earth.Supervisor do

  @moduledoc """
    Generic supervisor for Earth
  """

  use Supervisor

  def start_link(_) do
    opts = [
      strategy: :one_for_one
    ]
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_initargs) do
    children = [
      %{
        :id => Earth.EcoSystemSupervisor,
        :start => {Earth.EcoSystemSupervisor, :start_link, [nil]},
        :restart => :permanent,
        :shutdown => :timer.seconds(5),
        :type => :supervisor
      }
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end

end
