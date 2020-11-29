Application.put_env(:astro, Endpoint,
  secret_key_base: "J4lTFt000ENUVhu3dbIB2P2vRVl2nDBH6FLefnPUImL8mHYNX8Kln/N9J0HH19Mq",
  live_view: [
    signing_salt: "LfCCMxfkGME8S8P8XU3Z6/7+ZlD9611u"
  ]
)

Endpoint.start_link()

ExUnit.start()
