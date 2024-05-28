defmodule HelloWeb.Plugs.Locale do
  @moduledoc """
    example module Plug ( function-plug / module-plug )
  """

  import Plug.Conn

  @locales ["en", "fr", "de"]

  def init(locale_option), do: locale_option

  def call(%Plug.Conn{params: %{"locale" => locale}} = conn, _locale_option)
      when locale in @locales do
    assign(conn, :locale, locale)
  end
  def call(conn, locale_option) do
    assign(conn, :locale, locale_option)
  end

end
