defmodule MatchMenu.Repo do
  use Ecto.Repo,
    otp_app: :match_menu,
    adapter: Ecto.Adapters.Postgres
end
