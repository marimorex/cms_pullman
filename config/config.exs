# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cms_pullman,
  ecto_repos: [CmsPullman.Repo]

# Configures the endpoint
config :cms_pullman, CmsPullmanWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TNCHqVRuCsCNrhEzw2BvQAk25KOG6gv+Vp3hOShDjAAW3BQptjxvUk+oYMFfxXEq",
  render_errors: [view: CmsPullmanWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: CmsPullman.PubSub,
  live_view: [signing_salt: "hxKSJIMT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
