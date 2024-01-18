defmodule LiveElementsTestbedWeb.Features.FormElementTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  import Wallaby.Query

  feature "custom element with a form", %{session: session} do
    session
    |> visit("/form_example")
    |> find(css("form-element"))
    |> shadow_root()
    |> fill_in(css("input[name='name']"), with: "Bob")
    |> click(css("button"))
    |> assert_has(css("div", text: "Bob"))
  end

end
