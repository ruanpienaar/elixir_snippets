defmodule Crell.DistributionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crell.Distribution` context.
  """

  @doc """
  Generate a node.
  """
  def node_fixture(attrs \\ %{}) do
    {:ok, node} =
      attrs
      |> Enum.into(%{
        cookie: "some cookie",
        node_name: "some node_name"
      })
      |> Crell.Distribution.create_node()

    node
  end
end
