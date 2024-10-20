defmodule CrellWeb.LiveDashboard.Tracing do
  require Logger
  use Phoenix.LiveDashboard.PageBuilder
  import Phoenix.LiveDashboard.Helpers
  alias Phoenix.LiveDashboard.PageBuilder
  use Phoenix.LiveDashboard.Web, :live_component

  @impl true
  def init(_) do
    modules = []
    {:ok, %{modules: modules, active_traces: []}}
  end

  @impl true
  def update(assigns, socket) do
    assigns = normalize_update(assigns)
    apply_update(socket, assigns)
  end

  defp normalize_update(assigns) do
    assigns
    # |> normalize_columns()
    # |> validate_required_one_sortable_column()
    |> Map.put_new(:search, true)
    # |> Map.put_new(:limit, @limit)
    # |> Map.put_new(:row_attrs, [])
    # |> Map.put_new(:hint, nil)
    # |> Map.put_new(:dom_id, nil)
    # |> Map.update(:default_sort_by, nil, &(&1 && to_string(&1)))
    |> Map.put_new_lazy(:rows_name, fn ->
      Phoenix.Naming.humanize(assigns.title) |> String.downcase()
    end)
  end

  defp apply_update(socket, assigns) do
    assigns = normalize_table_params(assigns)

    # %{
    #   table_params: table_params,
    #   page: page,
    #   row_fetcher: row_fetcher
    # } = assigns

    # {rows, total, socket} = fetch_rows(row_fetcher, table_params, page.node, socket)
    # assigns = Map.merge(assigns, %{rows: rows, total: total})
    {:ok, assign(socket, assigns)}
  end

  defp normalize_table_params(assigns) do
    %{col: _columns, page: %{params: all_params}, default_sort_by: _sort_by} = assigns
    # sortable_columns = sortable_columns(columns)

    # sort_by =
    #   all_params
    #   |> get_in_or_first("sort_by", sort_by, sortable_columns)
    #   |> String.to_atom()

    # sort_dir =
    #   all_params
    #   |> get_in_or_first("sort_dir", sortable_dirs(columns, sort_by))
    #   |> String.to_atom()

    # limit =
    #   if assigns.limit do
    #     all_params
    #     |> get_in_or_first("limit", Enum.map(assigns.limit, &to_string/1))
    #     |> String.to_integer()
    #   end

    search = all_params["search"]
    search = if search == "", do: nil, else: search

    # table_params = %{sort_by: sort_by, sort_dir: sort_dir, limit: limit, search: search}
    table_params = %{search: search}

    assigns
    |> Map.put(:table_params, table_params)
    # |> Map.delete(:col)
    # |> Map.put(:columns, columns)
  end

  @impl true
  def mount(_params, _assigns, socket) do
    modules =
      case socket.assigns.page.node == Node.self do
        true ->
          :code.all_loaded()
        false ->
          case :erpc.call(socket.assigns.page.node, :code, :all_loaded, []) do
            modules when is_list(modules) ->
              modules
            term ->
              Logger.error("Failed to fetch modules : #{inspect(term)}")
              []
          end
      end
    {:ok, assign(socket, %{ :modules => modules })}
  end

  @impl true
  def menu_link(_, _) do
    # Check if DBG is present remotely
    # Check if recon is present remotely ( could inject if need be )
    # :skip
    {:ok, "Tracing"}
  end

  @impl true
  def render(assigns) do

    IO.inspect(assigns, label: "Assigns")

    ~H"""
      <select>
        <%= for {module_name, _module_path} <- assigns.modules do %>
          <option>
            <%= module_name %>
          </option>
        <% end %>
      </select>
      <label for="module_filter">Module filter</label>
      <input phx-change="search" phx-submit="search" phx-target={@myself} type="text" name="module_filter" id="module_filter" />
    """
  end

  @impl true
  def handle_event("search", %{"search" => search}, socket) do
    # table_params = %{socket.assigns.table_params | search: search}
    table_params = %{search: search}
    to = PageBuilder.live_dashboard_path(socket, socket.assigns.page, table_params)
    {:noreply, push_patch(socket, to: to)}
  end

end
