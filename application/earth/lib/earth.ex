defmodule Earth do
  @moduledoc """
  Documentation for `Earth`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Earth.hello()
      :world

  """
  def hello do
    :world
  end

  def add_duck(child_id) do
    Earth.EcoSystemSupervisor.add_duck(child_id)
  end

end
