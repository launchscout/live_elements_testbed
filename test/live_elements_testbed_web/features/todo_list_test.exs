defmodule LiveElementsTestbedWeb.Features.TodoListTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  import Wallaby.Query

  feature "todo list", %{session: session} do
    session
    |> visit("/todos")
    |> assert_text("todo list")
    |> within_shadow_dom("todo-list", fn shadow_dom ->
      shadow_dom
      |> fill_in(css("input[name='todo']"), with: "Do a thing")
      |> click(css("button"))
      |> assert_has(css("li", text: "Do a thing"))
    end)
  end

  feature "in a component", %{session: session} do
    session
    |> visit("/with_component")
    |> assert_text("todo list")
    |> within_shadow_dom("todo-list", fn shadow_dom ->
      shadow_dom
      |> fill_in(css("input[name='todo']"), with: "Do a thing")
      |> click(css("button"))
      |> assert_has(css("li", text: "Do a thing"))
    end)
  end

end
