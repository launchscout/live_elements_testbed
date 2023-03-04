defmodule LiveElementsTestbedWeb.Live.DataTable do
  use LiveElementsTestbedWeb, :live_view
  require LiveElements.CustomElementsHelpers
  import LiveElements.CustomElementsHelpers

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(
       items: [%{foo: "Foo1", bar: "Bar1", baz: "Baz2"}, %{foo: "Foo2", bar: "Bar2", baz: "Baz2"}]
     )}
  end

  custom_element :bx_data_table, events: ["bx-table-header-cell-sort"]

  @impl true
  def handle_event("bx-table-header-cell-sort", %{"sortDirection" => direction}, socket) do
    IO.inspect(direction, label: "sort direction")
    {:noreply, socket |> assign(
      items: [%{foo: "Foo2", bar: "Bar2", baz: "Baz2"}, %{foo: "Foo1", bar: "Bar1", baz: "Baz1"}]
    )}
  end
end
