defmodule Astro.SurfaceComponents.PrimaryButton do
  @moduledoc """
  Astro primary button.

  For more information, see Storybook: https://astro.magnetis.com.br/buttons#primary-buttons
  """
  use Astro.SurfaceComponent

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

  @impl true
  def render(assigns) do
    ~H"""
    <button disabled={{ @isDisabled }} class="{{ generate_class_names(assigns) }}"><slot/></button>
    """
  end

  @impl true
  def generate_class_names(assigns) do
    values =
      Enum.reduce(get_props(), [], fn %{name: prop}, acc ->
        value = Map.get(assigns, prop)

        if is_nil(value),
          do: acc,
          else: [build_css_class(@prefix, get_class_name(prop, value)) | acc]
      end)

    [@prefix | values]
    |> Enum.join(" ")
  end
end
