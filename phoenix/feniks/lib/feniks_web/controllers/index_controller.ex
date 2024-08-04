defmodule FeniksWeb.IndexController do
  use FeniksWeb, :controller

  # def init(opts), do: opts

  def index(conn, _params) do
    # IO.inspect([conn, params])
    render(conn, :index, layout: false)
  end

end
