defmodule LiveElementsTestbedWeb.Features.DataTableTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  import Wallaby.Query

  feature "sorting", %{session: session} do
    session
    |> visit("/data_table")
    |> assert_has(css("bx-table-cell:first-child", text: "Foo1"))
    |> click(css("bx-table-header-cell[data-column-id='foo']"))
    |> assert_has(css("bx-table-cell:first-child", text: "Foo2"))
  end

end
