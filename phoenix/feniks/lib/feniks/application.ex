defmodule Feniks.Application do
  use Application
  alias Telemetry.Metrics

  @impl true
  def start(_type, _args) do
    Supervisor.start_link(
      _children = [
        Feniks.WebSupervisor,
        {TelemetryMetricsPrometheus, [metrics: metrics()]},
      ],
      _opts = [
        strategy: :one_for_one,
        name: Feniks.SupervisorSupervisor
      ]
    )
  end

  defp metrics, do:
  [
    Metrics.counter("http.request.count"),
    Metrics.sum("http.request.payload_size", unit: :byte),
    Metrics.last_value("vm.memory.total", unit: :byte)
  ]

end
