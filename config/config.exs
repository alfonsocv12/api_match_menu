# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :match_menu,
  ecto_repos: [MatchMenu.Repo]

# Configures the endpoint
config :match_menu, MatchMenuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "P7IejWDnSelaQZqnHO3pemzpndxyJKMX1OdmL638L5JMauKKL2UnjQtvWkNOBd8n",
  render_errors: [view: MatchMenuWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MatchMenu.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "eHVLgjTG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

#Use gardian to generate de jwt token
config :match_menu, MatchMenu.Guardian,
       issuer: "MatchMenu",
       secret_key: "RkjAPm8iRqrQzH8RYYGOAhiCay20oZ3JyUwtubCAabTD1aPOSgy7EjVV4Ku+Q+F3"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
