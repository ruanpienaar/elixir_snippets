defmodule CrellWeb.Router do
  use CrellWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {CrellWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CrellWeb do
    pipe_through :browser

    live "/", NodeLive.Index, :index
    # live "/new", NodeLive.Index, :new

    scope "/nodes", NodeLive do
      live "/", Index, :index
      live "/new", Index, :new
      live "/:id/edit", Index, :edit
      live "/:id", Show, :show
      live "/:id/show/edit", Show, :edit
    end

    # get "/", NodeController, :nodes
    # get "/:node", NodeController, :node
    # post "/add_node", NodeController, :add_node
  end

  # Other scopes may use custom stacks.
  # scope "/api", CrellWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:crell, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CrellWeb.Telemetry, additional_pages: [
        # route_name: CrellWeb.LiveDashboard.Tracing
      ]
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
