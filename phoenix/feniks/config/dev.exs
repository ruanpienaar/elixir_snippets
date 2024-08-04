import Config

config :feniks, FeniksWeb.Endpoint,
  http: [ip: {0,0,0,0}, port: 8765],
  # code_reloader: true,
  debug_errors: true

config :feniks, dev_routes: true
