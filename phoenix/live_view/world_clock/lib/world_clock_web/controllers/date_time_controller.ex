defmodule WorldClockWeb.DatetimeController do
  use WorldClockWeb, :controller

  def init() do

  end

  def home(conn, _params) do
    date_time = DateTime.to_string(DateTime.now!("Etc/UTC"))
    render(conn, :home, date_time: date_time)
  end
end
