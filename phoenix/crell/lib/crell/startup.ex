defmodule Crell.Startup do

  alias Crell.Distribution
  alias Crell.Distribution.Node, as: CrellNode

  def startup() do
    IO.puts("\n\n\nRunning startup code\n\n\n")
    startup = Distribution.list_nodes()
      |> Task.async_stream(&add_hawk_node/1)
      |> Enum.each(fn _ -> :ok end)

    IO.puts("\n\n\nStartup result #{inspect(startup)}\n\n\n")

    IO.puts("\n\n\nFinished Running startup code\n\n\n")
    :ignore
  end

  def add_hawk_node(%CrellNode{node_name: node_name, cookie: cookie}) do
    :ok = Distribution.hawk_add_node(node_name, cookie)
  end

end
