defmodule FutMasterChampionshipWeb.Router do
  use FutMasterChampionshipWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", FutMasterChampionshipWeb.V1 do
    pipe_through :api

    resources "/people", People.PersonController, except: [:new, :edit]
    resources "/teams", Teams.TeamController, only: [:index, :show]
    resources "/countries", Countries.CountryController, only: [:index, :show]
    resources "/states", States.StateController, only: [:index, :show]
    resources "/leagues", Leagues.LeagueController, only: [:index, :show]
    resources "/championships", Championships.ChampionshipController, only: [:index, :show]
    resources "/players", Players.PlayerController, only: [:index, :show]
    resources "/championship_divisions", ChampionshipDivisions.ChampionshipDivisionController, only: [:index, :show]
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:fut_master_championship, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: FutMasterChampionshipWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
