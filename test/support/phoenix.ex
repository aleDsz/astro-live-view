defmodule Router do
  use Phoenix.Router
end

defmodule Endpoint do
  use Phoenix.Endpoint, otp_app: :astro
  plug Router
end
