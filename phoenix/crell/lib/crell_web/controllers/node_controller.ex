defmodule CrellWeb.NodeController do
  use CrellWeb, :controller

  def list(conn, params) do
    IO.inspect(params)
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :list, params: params, conn: conn)
  end
end
