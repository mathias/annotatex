# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :annotatex,
  ecto_repos: [Annotatex.Repo]

# Configures the endpoint
config :annotatex, AnnotatexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LgpSK6dBk1verIgNd9YvZy6YI8bOAe//Gj+RZiEbBtzfmaAfBZc1V0N0zm7y4Qyq",
  render_errors: [view: AnnotatexWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Annotatex.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Annotatex",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: Mix.env(),
  serializer: Sentinel.GuardianSerializer,
  hooks: GuardianDb # optional if using guardiandb

config :guardian_db, GuardianDb,
  repo: Annotatex.Repo,
  schema_name: "guardian_tokens", # default
  sweep_interval: 60 # default: 60 minutes

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
