use Mix.Config

config :git_hooks,
  auto_install: true,
  verbose: true,
  hooks: [
    pre_commit: [
      tasks: [
        {:cmd, "mix format"},
        {:cmd, "mix credo --strict"}
      ]
    ],
    pre_push: [
      verbose: false,
      tasks: [
        {:cmd, "mix test"}
      ]
    ]
  ]

if Mix.env() == :test do
  config :phoenix, :json_library, Jason
  config :mix_test_watch, clear: true
  config :logger, :log_level, :error
end
