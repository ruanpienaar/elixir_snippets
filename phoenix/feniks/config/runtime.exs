import Config

if System.get_env("PHX_SERVER") do
  config :blank, BlankWeb.Endpoint, server: true
end
