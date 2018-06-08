# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :partyplug,
  ecto_repos: [Partyplug.Repo]

# Configures the endpoint
config :partyplug, PartyplugWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ScHzqqz1KkzFY4AKEQzr5kfnk5/84blsTOQBHQLI7p3BwAnWubuBxdz3uGR81kwv",
  render_errors: [view: PartyplugWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Partyplug.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
