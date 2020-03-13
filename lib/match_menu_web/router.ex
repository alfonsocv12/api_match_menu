defmodule MatchMenuWeb.Router do
  use MatchMenuWeb, :router

  alias MatchMenu.Guardian
  alias MatchMenu.RestaurantGuardian
  alias MatchMenu.EmployeeGuardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  pipeline :resta_jwt_authenticated do
    plug RestaurantGuardian.AuthPipeline
  end

  pipeline :employee_jwt_authenticated do
    plug EmployeeGuardian.AuthPipeline
  end

  scope "/", MatchMenuWeb do
    pipe_through :api

    get "/", BaseController, :index

    post "/sign_in", UserController, :sign_in
    post "/sign_up", UserController, :create
  end

  scope "/", MatchMenuWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/my_user", UserController, :show
  end

  scope "/restaurant", MatchMenuWeb do
    pipe_through :api

    post "/sign_in", RestaurantController, :sign_in
    post "/sign_up", RestaurantController, :create
  end

  scope "/restaurant", MatchMenuWeb do
    pipe_through [:api, :resta_jwt_authenticated]

    get "/my_restaurant", RestaurantController, :show
    post "/employee/sign_up", EmployeeController, :create
  end

  scope "/employee", MatchMenuWeb do
    pipe_through :api

    get "/", EmployeeController, :index

    post "/sign_in", EmployeeController, :sign_in
  end

  scope "/employee", MatchMenuWeb do
    pipe_through [:api, :employee_jwt_authenticated]

    get "/my_info", EmployeeController, :show
  end

  scope "/employee_role", MatchMenuWeb do
    pipe_through :api

    get "/", EmployeeRoleController, :index
  end

  scope "/products", MatchMenuWeb do
    pipe_through :api

    get "/list/:restaurant_id", ProductController, :restaurant_products
  end

  scope "/product", MatchMenuWeb do
    pipe_through [:api, :resta_jwt_authenticated]

    post "/", ProductController, :create_resta_product
    # delete "/:id", ProductController, :
  end
end
