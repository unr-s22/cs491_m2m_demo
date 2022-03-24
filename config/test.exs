import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :many_to_many, ManyToMany.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "many_to_many_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :many_to_many, ManyToManyWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "OOL71zKQTeKwE1DW+aGOiG5Cqy86sISKDYlsHhh7TCpX7d+mt9AVwLxYIa7+Nj9J",
  server: false

# In test we don't send emails.
config :many_to_many, ManyToMany.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
