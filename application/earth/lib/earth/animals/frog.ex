defmodule Earth.Animals.Frog do
  @moduledoc """
    a frog instance
    i guess, the frog hunger cannot easily decay itself
  """

  require Logger

  use Agent

  def start_link(name) do
    hunger_level = 100
    Agent.start_link(
      fn ->
        Logger.info("Starting frog")
        {:ok, timer_ref} = :timer.apply_repeatedly(:timer.seconds(60), __MODULE__, :reduce_hunger, [self()])
        %{
          :hunger_level => hunger_level,
          :timer_ref => timer_ref
        }
      end,
      name: name
    )
  end

  def reduce_hunger(whom) do
    Logger.info("Reducing frog hunger levels")
    Agent.update(whom, &increase_hunger/1)
  end

  def feed(whom, reduce_hunger_level) when is_integer(reduce_hunger_level) do
    Logger.info("feeding frog")
    Agent.update(whom, fn state_data -> decrease_hunger(state_data, reduce_hunger_level) end)
  end

  def get_hunger_level(whom) do
    Agent.get(whom, &(&1.hunger_level))
  end

  # ---

  def increase_hunger(%{:hunger_level => hunger_level} = state_data) do
    %{state_data | :hunger_level => hunger_level - 1}
  end

  def decrease_hunger(%{:hunger_level => hunger_level} = state_data, reduce_hunger_level) do
    %{state_data | :hunger_level => hunger_level + reduce_hunger_level}
  end

end
