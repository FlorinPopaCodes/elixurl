# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixurl,
  ecto_repos: [Elixurl.Repo]

config :hashids,
  salt: "Y75+6k2g+tSyDzzc6k60Evu194C968mbeT0nyNx0TZI+i/rEgLWYgPbRDH1IGrF2",
  length: 3


# Configures the endpoint
config :elixurl, Elixurl.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PMy7RmJgWrJ3fjFyZbEQ0PuBfIaLn0Beeq1YJxaIdPhhBzgSAAwt06lEBp0P14JH",
  render_errors: [view: Elixurl.ErrorView, accepts: ~w(json)],
  pubsub: [name: Elixurl.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
