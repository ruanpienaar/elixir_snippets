defmodule Crell.Startup do

  alias Crell.Distribution
  alias Crell.Distribution.Node, as: CrellNode

  def startup() do
    IO.puts("\nRunning startup code\n")
    visible_nodes = Distribution.connected_nodes()
    IO.puts("\nvisible_nodes #{inspect(visible_nodes)}\n")
    startup_response = Distribution.list_nodes()
      |> Enum.map(
        fn node ->
          _ = startup_connectivity_check(node, visible_nodes)
          node
        end)
      |> Task.async_stream(&add_hawk_node/1)
      |> Enum.each(fn _ -> :ok end)

    IO.puts("\nStartup result #{inspect(startup_response)}\n")

    IO.puts("\nFinished Running startup code\n")
    :ignore
  end

  def startup_connectivity_check(node, visible_nodes) do
    %CrellNode{id: id, node_name: node_name} = node
    case Enum.member?(visible_nodes, node_name) do
      true ->
        Distribution.set_node_connected(id)
      false ->
        Distribution.set_node_disconnected(id)
    end
  end

  def add_hawk_node(node) do
    :ok = Distribution.hawk_add_node(node)
  end

end
