defmodule PlugExample.HelloWorldPlug do
  import Plug.Conn
  require Logger

  def init(options), do: options

  @doc """

  Example curl:

  ✗ curl -vvv localhost:8080
  *   Trying [::1]:8080...
  * connect to ::1 port 8080 failed: Connection refused
  *   Trying 127.0.0.1:8080...
  * Connected to localhost (127.0.0.1) port 8080
  > GET / HTTP/1.1
  > Host: localhost:8080
  > User-Agent: curl/8.4.0
  > Accept: */*
  >
  < HTTP/1.1 200 OK
  < cache-control: max-age=0, private, must-revalidate
  < content-length: 13
  < content-type: text/plain; charset=utf-8
  < date: Tue, 07 May 2024 09:12:58 GMT
  < server: Cowboy
  <
  Hello World!
  * Connection #0 to host localhost left intact

  Logging:

  Incomming request conn:: %Plug.Conn{
  adapter: {Plug.Cowboy.Conn, :...},
  assigns: %{},
  body_params: %Plug.Conn.Unfetched{aspect: :body_params},
  cookies: %Plug.Conn.Unfetched{aspect: :cookies},
  halted: false,
  host: "localhost",
  method: "GET",
  owner: #PID<0.329.0>,
  params: %Plug.Conn.Unfetched{aspect: :params},
  path_info: [],
  path_params: %{},
  port: 8080,
  private: %{},
  query_params: %Plug.Conn.Unfetched{aspect: :query_params},
  query_string: "",
  remote_ip: {127, 0, 0, 1},
  req_cookies: %Plug.Conn.Unfetched{aspect: :cookies},
  req_headers: [
    {"accept", "*/*"},
    {"host", "localhost:8080"},
    {"user-agent", "curl/8.4.0"}
  ],
  request_path: "/",
  resp_body: nil,
  resp_cookies: %{},
  resp_headers: [{"cache-control", "max-age=0, private, must-revalidate"}],
  scheme: :http,
  script_name: [],
  secret_key_base: nil,
  state: :unset,
  status: nil
  }
  Incomming request opts:: []

  """
  def call(conn, opts) do
    IO.inspect(conn, label: "Incomming request conn:")
    IO.inspect(opts, label: "Incomming request opts:")
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World!\n")
  end
end
