defmodule Astro.SurfaceComponents.Icon do
  @moduledoc """
  Astro iconography.

  For more information, see Storybook:https://astro.magnetis.com.br/iconography 
  """
  use Astro.SurfaceComponent

  @overridable_value_for_props [
    side: "space-{side}",
    size: "size-{size}"
  ]

  prefix("a-icon")

  @doc """
  Icon name
  """
  prop name, :atom, values: Astro.icons()

  @doc """
  Icon size
  """
  prop size, :atom, values: Astro.sizes()

  @doc """
  Icon side to render 
  """
  prop side, :atom, values: [:left, :right]

  @impl true
  def render(assigns) do
    ~H"""
    <i class="{{ generate_class_names(assigns) }}" />
    """
  end

  @impl true
  def get_class_name(:name, value) do
    Astro.icon(value)
  end

  def get_class_name(:side, value) do
    to_string(value)
  end
end
