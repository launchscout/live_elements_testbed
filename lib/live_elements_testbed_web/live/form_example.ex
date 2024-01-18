defmodule LiveElementsTestbedWeb.FormExample do
  use LiveElementsTestbedWeb, :live_view

  use LiveElements.CustomElementsHelpers

  custom_element :form_element, events: ["submit"]

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(name: "")}
  end

end
