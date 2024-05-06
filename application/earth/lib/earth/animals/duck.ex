defmodule Earth.Animals.Duck do
  @moduledoc """
    The ugly duck
  """
  use GenServer
  require Logger

  def start_link(name) do
    # Could do with registry example ( uses term, instead of atom name )
    GenServer.start_link(__MODULE__, [nil], name: name)
  end

  def feed(whom, hunger_reduce_level) when is_integer(hunger_reduce_level) do
    GenServer.call(whom, {:change_hunger, hunger_reduce_level}, :timer.seconds(5))
  end

  def get_hunger_level(whom) do
    GenServer.call(whom, :get_hunger_level, :timer.seconds(5))
  end

  # ---

  @impl true
  def init(_initargs) do
    timer_ref = hunger_tick()
    {:ok, %{
      :hunger_level => 100,
      :timer_ref => timer_ref
      }
    }
  end

  @impl true
  def handle_call({:change_hunger, hunger_reduce_level}, _from, %{:hunger_level => hunger_level} = state_data) do
    {:reply, :ok, %{state_data | :hunger_level => (hunger_reduce_level - 1) + hunger_level}}
  end
  def handle_call(:get_hunger_level, _from, %{:hunger_level => hunger_level} = state_data) do
    {:reply, hunger_level, state_data}
  end
  def handle_call(request, _from, state_data) do
    Logger.warning(%{:unhandled_message_handle_call => request})
    {:reply, :ok, state_data}
  end

  @impl true
  def handle_cast(request, state_data) do
    Logger.warning(%{:unhandled_message_handle_cast => request})
    {:noreply, :ok, state_data}
  end

  @impl true
  def handle_info(:reduce_hunger_levels, %{:hunger_level => hunger_level} = state_data) do
    Logger.info("Reducing duck hunger levels")
    {:noreply, %{state_data| :hunger_level => hunger_level - 1 }}
  end

  @impl true
  def terminate(reason, state_data) do
    Logger.critical(%{__MODULE__ => %{
      :terminate_state_data => state_data,
      :reason => reason
    }})
  end

  def hunger_tick do
    {:ok, timer_ref} = :timer.send_interval(:timer.seconds(60), self(), :reduce_hunger_levels)
    timer_ref
  end

end
