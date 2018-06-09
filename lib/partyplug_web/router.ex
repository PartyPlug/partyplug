defmodule PartyplugWeb.Router do
  use PartyplugWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  scope "/", PartyplugWeb do
    pipe_through :browser
    coherence_routes()
  end

  scope "/", PartyplugWeb do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", PartyplugWeb do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/", PartyplugWeb do
    pipe_through :protected
  end

  scope "/api", PartyplugWeb do
    pipe_through :api
  end
end
