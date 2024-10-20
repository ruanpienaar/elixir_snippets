defmodule Crell.Distribution do
  @moduledoc """
  The Distribution context.
  """

  import Ecto.Query, warn: false
  alias Crell.Repo

  alias Crell.Distribution.Node, as: CrellNode

  @doc """
  Returns the list of nodes.

  ## Examples

      iex> list_nodes()
      [%Node{}, ...]

  """
  def list_nodes do
    Repo.all(CrellNode)
  end

  @doc """
  Gets a single node.

  Raises `Ecto.NoResultsError` if the Node does not exist.

  ## Examples

      iex> get_node!(123)
      %Node{}

      iex> get_node!(456)
      ** (Ecto.NoResultsError)

  """
  def get_node!(id), do: Repo.get!(CrellNode, id)

  @doc """
  Creates a node.

  ## Examples

      iex> create_node(%{field: value})
      {:ok, %Node{}}

      iex> create_node(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_node(attrs \\ %{}) do
    %CrellNode{}
    |> CrellNode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a node.

  ## Examples

      iex> update_node(node, %{field: new_value})
      {:ok, %Node{}}

      iex> update_node(node, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_node(%CrellNode{} = node, attrs) do
    node
    |> CrellNode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a node.

  ## Examples

      iex> delete_node(node)
      {:ok, %Node{}}

      iex> delete_node(node)
      {:error, %Ecto.Changeset{}}

  """
  def delete_node(%CrellNode{} = node) do
    Repo.delete(node)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking node changes.

  ## Examples

      iex> change_node(node)
      %Ecto.Changeset{data: %Node{}}

  """
  def change_node(%CrellNode{} = node, attrs \\ %{}) do
    CrellNode.changeset(node, attrs)
  end

  # Management cide

  def connected_nodes() do
    Node.list([:visible, :hidden])
  end

  def hawk_add_node(node_name, cookie) when is_binary(node_name) and is_binary(cookie) do
    node_atom = String.to_atom(node_name)
    cookie_atom = String.to_atom(cookie)
    connected_callback = fn -> :io.format(~c"Node connected") end
    disconnected_callback = fn -> :io.format(~c"Node disconnected") end

    connected_callbacks = [{:crell_connect, connected_callback}]
    disconnected_callbacks = [{:crell_disconnect,disconnected_callback}]

    case :hawk.node_exists(node_atom) do
      {:ok, _pid, callbacks} ->
        case :lists.member(:crell_connect, callbacks) and :lists.member(:crell_disconnect, callbacks) do
          true ->
            :ok
          false ->
            {:ok,{_, :updated}} = :hawk.add_connect_callback(node_atom, connected_callbacks)
            {:ok,{_, :updated}} = :hawk.add_disconnect_callback(node_atom, disconnected_callbacks)
            :ok
        end
      {:error, :no_such_node} ->
        {:ok,_} = :hawk.add_node(node_atom, cookie_atom, connected_callbacks, disconnected_callbacks)
        :ok
    end
  end

  def hawk_remove_node(node_name) when is_binary(node_name) do
    node_atom = String.to_atom(node_name)
    case :hawk.remove_node(node_atom) do
      {:error, :no_such_node} ->
        :ok
      :ok ->
        :ok
    end
  end

end
