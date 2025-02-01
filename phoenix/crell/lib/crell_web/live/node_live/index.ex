defmodule CrellWeb.NodeLive.Index do
  use CrellWeb, :live_view

  alias Crell.Distribution
  alias Crell.Distribution.Node

  @impl true
  def mount(_params, _session, socket) do
    :ok = CrellWeb.Pubsub.sub()
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
    # %Node{cookie: cookie, node_name: node_name} = node
    :ok = Distribution.hawk_add_node(node)
    {:noreply, stream_insert(socket, :nodes, node)}
  end

  def handle_info({}, socket) do
    {:noreply, stream(socket, :nodes, Distribution.list_nodes())}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    %Node{cookie: _cookie, node_name: node_name} = node = Distribution.get_node!(id)
    :ok = Distribution.hawk_remove_node(node_name)
    {:ok, _} = Distribution.delete_node(node)
    {:noreply, stream_delete(socket, :nodes, node)}
  end
end
