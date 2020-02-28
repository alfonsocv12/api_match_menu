defmodule MatchMenuWeb.Router do
  use MatchMenuWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MatchMenuWeb do
    pipe_through :api

    get "/", BaseController, :index

    resources "/users", UserController, only: [:create, :show]
    post "/sign_up", UserController, :create
  end
end
