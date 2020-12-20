defmodule Astro.SurfaceComponents.IconLabelButton do
  @moduledoc """
  Astro iconlabel button.

  For more information, see Storybook: https://astro.magnetis.com.br/buttons#iconlabel-buttons
  """
  use Astro.SurfaceComponent

  alias Astro.SurfaceComponents.Icon

  @excluded_props ~w(id disabled right_icon icon_size)a

  @overridable_value_for_props [
    icon: "iconlabel"
  ]

  prefix("a-btn")

  @doc """
  Button background and foreground color
  """
  prop color, :atom, values: Astro.colors()

  @doc """
  Button background and foreground gradient color
  """
  prop gradient, :atom, values: Astro.gradients()

  @doc """
  Button size
  """
  prop size, :atom, values: Astro.sizes()

  @doc """
  Icon size
  """
  prop icon_size, :atom, values: Astro.sizes()

  @doc """
  Icon name
  """
  prop icon, :atom, required: true, values: Astro.icons()

  @doc """
  Button should use icon on right side?
  """
  prop right_icon, :boolean, default: false

  @impl true
  def render(assigns) do
    ~H"""
    <button disabled={{ @disabled }} class="{{ generate_class_names(assigns) }}">
      <Icon id={{ @id <> "_icon" }} :if={{ not @right_icon }} name={{ @icon }} size={{ @icon_size }} side={{ :left }} />
      <slot/>
      <Icon id={{ @id <> "_icon" }} :if={{ @right_icon }} name={{ @icon }} size={{ @icon_size }} side={{ :right }} />
    </button>
    """
  end
end
