Application.stop(:phoenix)
Application.put_env(:phoenix, :json_library, Jason)
Application.start(:phoenix)
Application.ensure_started(:phoenix)

ExUnit.start()
