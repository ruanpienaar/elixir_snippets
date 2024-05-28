defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  # Open ended plug
  plug HelloWeb.Plugs.Locale, "en"

  # Specific to certain action Plug
  # plug HelloWeb.Plugs.Locale, "en" when action in [:index]

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end
