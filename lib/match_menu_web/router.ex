defmodule MatchMenuWeb.Router do
  use MatchMenuWeb, :router

  alias MatchMenu.Guardian
  
  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/", MatchMenuWeb do
    pipe_through :api
    IO.puts("etnro")
    get "/", BaseController, :index

    post "/sign_in", UserController, :sign_in
    post "/sign_up", UserController, :create
  end

  scope "/", MatchMenuWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/my_user", UserController, :show
  end
end
