use Mix.Config

if Mix.env() == :test do
  config :phoenix, :json_library, Jason
  config :mix_test_watch, clear: true
  config :logger, :log_level, :error
end
