use Mix.Config

# Configure your database
config :match_menu, MatchMenu.Repo,
  username: "postgres",
  password: "postgres",
  database: "match_menu_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :match_menu, MatchMenuWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
