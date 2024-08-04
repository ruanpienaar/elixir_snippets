defmodule FeniksWeb.IndexHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `index_html` directory for all templates available.
  """
  use FeniksWeb, :html

  embed_templates "index_html/*"
end
