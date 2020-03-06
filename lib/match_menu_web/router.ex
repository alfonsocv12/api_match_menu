defmodule MatchMenuWeb.Router do
  use MatchMenuWeb, :router

  alias MatchMenu.Guardian
  alias MatchMenu.RestaurantGuardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  pipeline :resta_jwt_authenticated do
    plug RestaurantGuardian.AuthPipelineResta
  end

  scope "/", MatchMenuWeb do
    pipe_through :api

    get "/", BaseController, :index

    post "/sign_in", UserController, :sign_in
    post "/sign_up", UserController, :create

    resources "/productos", ProductosController, [:insert, :get, :get_list]
  end

  scope "/restaurant", MatchMenuWeb do
    pipe_through :api

    post "/sign_in", RestaurantController, :sign_in
    post "/sign_up", RestaurantController, :create
  end

  scope "/restaurant", MatchMenuWeb do
    pipe_through [:api, :resta_jwt_authenticated]

    get "/my_restaurant", RestaurantController, :show
  end

  scope "/", MatchMenuWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/my_user", UserController, :show
  end
end
