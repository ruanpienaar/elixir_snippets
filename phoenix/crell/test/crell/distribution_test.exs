defmodule Crell.DistributionTest do
  use Crell.DataCase

  alias Crell.Distribution

  describe "nodes" do
    alias Crell.Distribution.Node

    import Crell.DistributionFixtures

    @invalid_attrs %{node_name: nil, cookie: nil}

    test "list_nodes/0 returns all nodes" do
      node = node_fixture()
      assert Distribution.list_nodes() == [node]
    end

    test "get_node!/1 returns the node with given id" do
      node = node_fixture()
      assert Distribution.get_node!(node.id) == node
    end

    test "create_node/1 with valid data creates a node" do
      valid_attrs = %{node_name: "some node_name", cookie: "some cookie"}

      assert {:ok, %Node{} = node} = Distribution.create_node(valid_attrs)
      assert node.node_name == "some node_name"
      assert node.cookie == "some cookie"
    end

    test "create_node/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Distribution.create_node(@invalid_attrs)
    end

    test "update_node/2 with valid data updates the node" do
      node = node_fixture()
      update_attrs = %{node_name: "some updated node_name", cookie: "some updated cookie"}

      assert {:ok, %Node{} = node} = Distribution.update_node(node, update_attrs)
      assert node.node_name == "some updated node_name"
      assert node.cookie == "some updated cookie"
    end

    test "update_node/2 with invalid data returns error changeset" do
      node = node_fixture()
      assert {:error, %Ecto.Changeset{}} = Distribution.update_node(node, @invalid_attrs)
      assert node == Distribution.get_node!(node.id)
    end

    test "delete_node/1 deletes the node" do
      node = node_fixture()
      assert {:ok, %Node{}} = Distribution.delete_node(node)
      assert_raise Ecto.NoResultsError, fn -> Distribution.get_node!(node.id) end
    end

    test "change_node/1 returns a node changeset" do
      node = node_fixture()
      assert %Ecto.Changeset{} = Distribution.change_node(node)
    end
  end
end
