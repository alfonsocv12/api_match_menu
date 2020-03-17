defmodule MatchMenuWeb.TableController do
  use MatchMenuWeb, :controller

  alias MatchMenu.Tables
  alias MatchMenu.Tables.Table

  action_fallback MatchMenuWeb.FallbackController

  def index(conn, _params) do
    tables = Tables.list_tables()
    render(conn, "index.json", tables: tables)
  end

  def create(conn, %{"table" => table_params}) do
    with {:ok, %Table{} = table} <- Tables.create_table(table_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.table_path(conn, :show, table))
      |> render("show.json", table: table)
    end
  end

  def show(conn, %{"id" => id}) do
    table = Tables.get_table!(id)
    render(conn, "show.json", table: table)
  end

  def update(conn, %{"id" => id, "table" => table_params}) do
    table = Tables.get_table!(id)

    with {:ok, %Table{} = table} <- Tables.update_table(table, table_params) do
      render(conn, "show.json", table: table)
    end
  end

  def delete(conn, %{"id" => id}) do
    table = Tables.get_table!(id)

    with {:ok, %Table{}} <- Tables.delete_table(table) do
      send_resp(conn, :no_content, "")
    end
  end
end
