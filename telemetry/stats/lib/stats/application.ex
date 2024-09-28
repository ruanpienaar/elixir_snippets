defmodule Stats.Application do
  use Application
  import Telemetry.Metrics

  @impl true
  def start(_type, _args) do
    children = [
      {TelemetryMetricsPrometheus, metrics: metrics()}
      # {CustomReporter, metrics: metrics()}
    ]

    opts = [strategy: :one_for_one, name: Stats.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp metrics do
    [
      counter("thing.count.counter"),
      last_value("vm.memory.total"),
      # Fix these, they need .counter or .metric-type
      # counter("cowboy.request.start"),
      # counter("cowboy.request.stop"),
      # counter("plug.router.dispatch.start"),
      # counter("plug.router.dispatch.stop"),
      # counter("prometheus.metrics.plug.start"),
      # counter("prometheus.metrics.plug.stop"),
      counter("metrics.emit.value.counter", event_name: [:metrics, :emit], measurement: :value),
      sum("metrics.emit.value.sum", event_name: [:metrics, :emit], measurement: :value)
    ]
  end
end
