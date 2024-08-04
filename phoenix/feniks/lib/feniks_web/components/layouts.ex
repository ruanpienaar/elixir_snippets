defmodule FeniksWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use FeniksWeb, :controller` and
  `use FeniksWeb, :live_view`.
  """
  use FeniksWeb, :html

  embed_templates "layouts/*"
end
