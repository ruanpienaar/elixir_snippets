defmodule CrellWeb.NodeLive.Index do
  use CrellWeb, :live_view

  alias Crell.Distribution
  alias Crell.Distribution.Node

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :nodes, Distribution.list_nodes())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Node")
    |> assign(:node, Distribution.get_node!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Node")
    |> assign(:node, %Node{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Nodes")
    |> assign(:node, nil)
  end

  @impl true
  def handle_info({CrellWeb.NodeLive.FormComponent, {:saved, node}}, socket) do
    %Node{cookie: cookie, node_name: node_name} = node
    node_atom = String.to_atom(node_name)
    cookie_atom = String.to_atom(cookie)
    connected_callback = fn -> IO.inspect("Node has connected") end
    disconnected_callback = fn -> IO.inspect("Node has disconnected") end

    case :hawk.node_exists(node_atom) do
      {:ok, _pid, callbacks} ->
        case :lists.member(:crell_connect, callbacks) and :lists.member(:crell_disconnect, callbacks) do
          true ->
            :ok
          false ->
            {:ok,{_, :updated}} = :hawk.add_connect_callback(node_atom, [{:crell_connect, connected_callback}])
            {:ok,{_, :updated}} = :hawk.add_disconnect_callback(node_atom, [{:crell_disconnect,disconnected_callback}])
        end
      {:error, :no_such_node} ->
        {:ok,_} = :hawk.add_node(node_atom, cookie_atom, [connected_callback], [disconnected_callback])
    end

    {:noreply, stream_insert(socket, :nodes, node_atom)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    %Node{cookie: _cookie, node_name: node_name} = node = Distribution.get_node!(id)
    node_atom = String.to_atom(node_name)
    case :hawk.remove_node(node_atom) do
      {:error, :no_such_node} ->
        :ok
      :ok ->
        :ok
    end
    {:ok, _} = Distribution.delete_node(node)
    {:noreply, stream_delete(socket, :nodes, node)}
  end
end
