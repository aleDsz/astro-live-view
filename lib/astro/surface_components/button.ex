defmodule Astro.SurfaceComponents.Button do
  @moduledoc """
  Astro primary button.

  For more information, see Storybook: https://astro.magnetis.com.br/buttons#primary-buttons
  """
  use Astro.SurfaceComponent

  @doc """
  Button background and foreground color
  """
  prop color, :atom, required: false, values: Astro.colors()

  @doc """
  Button size
  """
  prop size, :atom, required: false, values: Astro.sizes()

  @impl true
  def mount(socket) do
    {:ok, assign(socket, classes: ["a-button"])}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <button class="{{ classes }}">{{ inner_block }}</button>
    """
  end
end
