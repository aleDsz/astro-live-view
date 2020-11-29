defmodule Astro.ComponentCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      use Astro.Case
      import Phoenix.LiveViewTest
      import Astro.ComponentHelper
      import Phoenix.ConnTest

      @endpoint Endpoint
    end
  end
end
