defmodule Astro.ComponentCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      use Astro.Case
      use Surface.LiveViewTest

      @endpoint Endpoint

      # defmacrop assert_component(html, assigns \\ [], do: block) do
      #   content = render_surface(block, assigns)
      #   rendered_component = render_component(module(), content)

      #   left = quote do: normalize_html(unquote(rendered_component))
      #   right = quote do: normalize_html(unquote(html))

      #   quote do
      #     assert unquote(left) =~ unquote(right)
      #   end
      # end

      # defp render_surface(inner_block, assigns \\ []) do
      #   wrapped_block = fn _, _ -> inner_block end
      #   surface_assigns = %{provided_templates: [:__default__]}

      #   assigns
      #   |> Map.new()
      #   |> Map.put(:inner_block, wrapped_block)
      #   |> Map.put(:__surface__, surface_assigns)
      # end
    end
  end
end
