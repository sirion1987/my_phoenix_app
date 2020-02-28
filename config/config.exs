# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :my_phoenix_app,
  ecto_repos: [MyPhoenixApp.Repo]

# Configures the endpoint
config :my_phoenix_app, MyPhoenixAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Iig09GiVxSwB8Mq9v9+izO0oQUSjfGu6lewxIcAElBhP6lvDiPemxGn/aJfmpGyv",
  render_errors: [view: MyPhoenixAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyPhoenixApp.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "ue88KiEJ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
