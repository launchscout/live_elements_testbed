defmodule LiveElementsTestbedWeb.Router do
  use LiveElementsTestbedWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LiveElementsTestbedWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveElementsTestbedWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/todos", TodoLive
    live "/simple_guy", SimpleGuy
    live "/eat_pie", EatPie
    live "/with_component", WithComponent
    live "/data_table", Live.DataTable
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveElementsTestbedWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:live_elements_testbed, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: LiveElementsTestbedWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
