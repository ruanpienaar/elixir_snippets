defmodule CrellWeb.NodeLive.FormComponent do
  use CrellWeb, :live_component

  alias Crell.Distribution

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage node records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="node-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:node_name]} type="text" label="Node name" />
        <.input field={@form[:cookie]} type="text" label="Cookie" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Node</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{node: node} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Distribution.change_node(node))
     end)}
  end

  @impl true
  def handle_event("validate", %{"node" => node_params}, socket) do
    changeset = Distribution.change_node(socket.assigns.node, node_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"node" => node_params}, socket) do
    save_node(socket, socket.assigns.action, node_params)
  end

  defp save_node(socket, :edit, node_params) do
    case Distribution.update_node(socket.assigns.node, node_params) do
      {:ok, node} ->
        notify_parent({:saved, node})

        {:noreply,
         socket
         |> put_flash(:info, "Node updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_node(socket, :new, node_params) do
    case Distribution.create_node(node_params) do
      {:ok, node} ->
        notify_parent({:saved, node})

        {:noreply,
         socket
         |> put_flash(:info, "Node created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
