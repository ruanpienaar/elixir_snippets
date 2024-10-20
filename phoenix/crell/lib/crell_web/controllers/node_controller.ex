defmodule CrellWeb.NodeController do
  use CrellWeb, :controller

  def node(conn, %{"node" => node}) do
    render(conn, :node, node: node)
  end

  def nodes(conn, params) do
    IO.inspect(conn, pretty: :true, limit: :infinity, printable_limit: :infinity)
    IO.inspect(params, pretty: :true, limit: :infinity, printable_limit: :infinity)
    # The home page is often custom made,
    # so skip the default app layout.
    {:ok, params_json} = Jason.encode(params)
    nodes = Node.list()
    render(conn, :nodes, %{params: params_json, nodes: nodes, form: %{
      node: nil,
      cookie: nil
    }})
  end

  def add_node(conn, %{"node" => node, "cookie" => cookie}) do
    IO.inspect(conn, pretty: :true, limit: :infinity, printable_limit: :infinity)
    IO.inspect(node, pretty: :true, limit: :infinity, printable_limit: :infinity)
    IO.inspect(cookie, pretty: :true, limit: :infinity, printable_limit: :infinity)
    # TODO: add changeset query here
    # :hawk.add_connect_callback()
  end

end
