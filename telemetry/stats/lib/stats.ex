defmodule Stats do
  def emit(value) do
    :telemetry.execute([:metrics, :emit], %{value: value})
  end

  def thing_count_inc(_) do
    _ = :telemetry.execute([:thing, :count], %{})
  end
end
