defmodule Earth.EcoSystem do
  @moduledoc """
    insert some better text here
  """

  def list_eco_system do
    Supervisor.which_children(Earth.EcoSystemSupervisor)
    |> Enum.map(fn {_, pid, _, _} -> Process.info(pid) end)
  end

end
