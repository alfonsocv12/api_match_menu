defmodule MatchMenuWeb.Router do
  use MatchMenuWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MatchMenuWeb do
    pipe_through :api

    get "/", BaseController, :index

    post "/sign_in", UserController, :sign_in
    post "/sign_up", UserController, :create
  end
end
