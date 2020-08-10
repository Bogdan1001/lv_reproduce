# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lv_reproduce,
  ecto_repos: [LvReproduce.Repo]

# Configures the endpoint
config :lv_reproduce, LvReproduceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1R3bVIkS49vLMmXAhKq+TFvyt+/CCGfquR7D0WoxF1tWKI3oPwPF5qqc0OFdBBTo",
  render_errors: [view: LvReproduceWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LvReproduce.PubSub,
  live_view: [signing_salt: "1sZpV1aK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
