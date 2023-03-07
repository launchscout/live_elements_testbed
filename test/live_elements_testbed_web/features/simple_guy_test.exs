defmodule LiveElementsTestbedWeb.Features.SimpleGuyTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  import Wallaby.Query

  feature "todo list", %{session: session} do
    session
    |> visit("/simple_guy")
    |> within_shadow_dom("simple-guy", fn shadow_dom ->
      shadow_dom
      |> assert_has(css("div", text: "My name is Bob and I am 11 years old"))
    end)
  end

end
