defmodule Astro.SurfaceComponents.Button do
  @moduledoc """
  Astro primary button.

  For more information, see Storybook: https://astro.magnetis.com.br/buttons#primary-buttons
  """
  use Astro.SurfaceComponent

  prefix("a-btn")

  @doc """
  Button background and foreground color
  """
  prop color, :atom, required: false, values: Astro.colors()

  @doc """
  Button size
  """
  prop size, :atom, required: false, values: Astro.sizes()

  @impl true
  def render(assigns) do
    ~H"""
    <button class="{{ @classes }}">{{ @children }}</button>
    """
  end
end
