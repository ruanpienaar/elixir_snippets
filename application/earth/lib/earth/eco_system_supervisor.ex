defmodule Earth.EcoSystemSupervisor do

  @moduledoc """
    Earth supervisor is responsible for the contents of the Earth.
  """

  use Supervisor

  def start_link(_) do
    opts = [
      strategy: :one_for_one
    ]
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def add_duck(child_id) do
    add_child(child_id, Earth.Animals.Duck)
  end

  def add_whale(child_id) do
    add_child(child_id, Earth.Animals.Whale)
  end

  def add_frog(child_id) do
    add_child(child_id, Earth.Animals.Frog)
  end

  def add_child(child_id, module) do
    child_spec = %{
      :id => child_id,
      :start => {module, :start_link, [child_id]},
      :restart => :permanent,
      :shutdown => :timer.seconds(5),
      :type => :worker
    }
    Supervisor.start_child(__MODULE__, child_spec)
  end

  @impl true
  def init(_initargs) do
    children = [

    ]
    Supervisor.init(children, strategy: :one_for_one)
  end

end
