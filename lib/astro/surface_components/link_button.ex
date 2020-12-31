defmodule Astro.SurfaceComponents.LinkButton do
  @moduledoc """
  Astro link button with `a` element.

  For more information, see Storybook: https://astro.magnetis.com.br/buttons#buttons-in-a-elements
  """
  use Astro.SurfaceComponent

  @excluded_props ~w(id classNames href target)a

  @overridable_value_for_props [
    disabled: "disabled"
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
  Link to redirect
  """
  prop href, :string

  @doc """
  Link target
  """
  prop target, :string, values: ~w(_blank _self _parent _top)

  @impl true
  def render(assigns) do
    ~H"""
    <a href={{ @href }} target={{ @target }} class="{{ generate_class_names(assigns) }}">
      <slot/>
    </a>
    """
  end

  def get_class_name(:disabled, value), do: to_string(value)
end
