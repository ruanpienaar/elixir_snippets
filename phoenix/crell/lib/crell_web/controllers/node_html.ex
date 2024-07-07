defmodule CrellWeb.NodeHTML do
  @moduledoc """
  This module contains pages rendered by NodeController.

  See the `node_html` directory for all templates available.
  """
  use CrellWeb, :html

  embed_templates "node_html/*"
end
