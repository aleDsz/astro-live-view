defmodule Astro.SurfaceComponents.IconLinkButton do
  @moduledoc """
  Astro icon link button.

  For more information, see Storybook: https://astro.magnetis.com.br/buttons#icon-link-buttons
  """
  use Astro.SurfaceComponent

  alias Astro.SurfaceComponents.Icon

  @excluded_props ~w(id disabled icon_size)a

  @overridable_value_for_props [
    icon: "iconlink",
    right_icon: {"true", "iconlink-right"},
    bold: {"true", "iconlink-bold"}
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

  @doc """
  Button should use bold text?
  """
  prop bold, :boolean, default: false

  @impl true
  def render(assigns) do
    ~H"""
    <button disabled={{ @disabled }} class="{{ generate_class_names(assigns) }}">
      <Icon id={{ @id <> "_icon" }} :if={{ not @right_icon }} name={{ @icon }} size={{ @icon_size }} />
      <slot/>
      <Icon id={{ @id <> "_icon" }} :if={{ @right_icon }} name={{ @icon }} size={{ @icon_size }} />
    </button>
    """
  end

  @impl true
  def get_class_name(:right_icon, value), do: to_string(value)

  def get_class_name(:bold, value), do: to_string(value)
end
