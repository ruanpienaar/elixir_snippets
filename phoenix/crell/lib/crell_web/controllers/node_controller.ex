defmodule CrellWeb.NodeController do
  use CrellWeb, :controller

  def node(conn, %{"node" => node}) do
    render(conn, :node, node: node)
  end

  def nodes(conn, params) do
    # IO.inspect(params)
    # The home page is often custom made,
    # so skip the default app layout.
    {:ok, params_json} = Jason.encode(params)
    nodes = Node.list()
    render(conn, :nodes, %{params: params_json, nodes: nodes})
  end

  def add_node(conn, %{"node" => node, "cookie" => cookie}) do
    :hawk.add_connect_callback()
  end

end
