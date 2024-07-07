defmodule CrellWeb.NodeHTML do
  @moduledoc """
  This module contains pages rendered by NodeController.

  See the `node_html` directory for all templates available.
  """
  use CrellWeb, :html

  # NB: Either Embeded templates OR def ACTION(assigns) do function

  embed_templates "node_html/*"

  # def nodes(%{:conn => conn} = assigns) do
  #   # IO.inspect(conn)
  #   string = "bla"
  #   ~H"""
  #   Hello! assigns: <% @params %>
  #   """
  # end
end
