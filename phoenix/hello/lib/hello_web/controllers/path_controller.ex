defmodule HelloWeb.PathController do
  use HelloWeb, :controller
  require Logger

  #Action
  def handle_path(conn, params) do
    Logger.info(conn)
    Logger.info(params)
    render(conn, :handle_path)
  end

end
