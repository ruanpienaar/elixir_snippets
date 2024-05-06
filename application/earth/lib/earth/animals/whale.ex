defmodule Earth.Animals.Whale do
  @moduledoc """
     create a instantiated whale
  """

  require Logger

  # proc_lib

  def start_link(name, options \\ []) do
    return = {:ok, pid} = :proc_lib.start_link(__MODULE__, :init, [options])
    :true = Process.register(pid, name)
    return
  end

  def feed(whom, hunger_reduce_level) when is_integer(hunger_reduce_level) do
    _ = send(whom, {:change_hunger, hunger_reduce_level})
    {:ok, :fed}
  end

  def get_hunger_level(whom) do
    _ = send(whom, {:client, self(), :request, :get_hunger_level})
    receive do
      {:hunger_level, hunger_level} ->
        hunger_level
    after
      :timer.seconds(5) ->
        {:error, :timeout}
    end
  end

  # ---

  def init(_options) do
    Logger.info("Starting #{__MODULE__}")
    :ok = :proc_lib.init_ack({:ok, self()})
    timer_ref = hunger_tick()
    loop(%{:hunger_level => 100, :timer_ref => timer_ref})
  end

  def loop(%{:hunger_level => hunger_level} = state_data) do
    receive do
      {:client, client_pid, :request, :get_hunger_level} ->
        _ = send(client_pid, {:hunger_level, hunger_level})
        loop(state_data)
      {:change_hunger, hunger_reduce_level} ->
        loop(%{state_data | :hunger_level => hunger_level + hunger_reduce_level })
      :reduce_hunger_levels ->
        Logger.info("Reducing whale hunger levels")
        loop(%{state_data | :hunger_level => hunger_level - 1})
      msg ->
        Logger.warning(%{:unknown_message => msg})
        loop(state_data)
    end
  rescue
    e ->
      Logger.error(Exception.format(:error, e, __STACKTRACE__))
      _ = terminate(state_data)
      reraise e, __STACKTRACE__
  end

  def terminate(state_data) do
    Logger.critical(%{__MODULE__ => %{:terminate_state_data => state_data}})
  end

  def hunger_tick do
    {:ok, timer_ref} = :timer.send_interval(:timer.seconds(60), :reduce_hunger_levels)
    timer_ref
  end

end
