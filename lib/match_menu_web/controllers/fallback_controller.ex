defmodule MatchMenuWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use MatchMenuWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(MatchMenuWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(MatchMenuWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, claims}) do
    conn
    |> put_status(:unprocessable_entity)
    |> json(%{error: claims})
  end
end
