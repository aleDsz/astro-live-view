defmodule Astro.SurfaceComponent do
  @moduledoc """
  Astro interface to integrate with Surface library
  """
  @callback generate_class_names(Phoenix.Socket.t()) :: binary()

  @doc """
  Defines component class name prefix
  """
  defmacro prefix(prefix) do
    quote do
      @prefix unquote(prefix)
    end
  end

  @doc """
  When the caller uses `Astro.SurfaceComponent` we implements `Surface.LiveComponent`
  module and add some middleware functions to provide a better compile-time
  validation
  """
  defmacro __using__(opts) do
    Module.register_attribute(__CALLER__.module, :prefix, accumulate: true)
    Module.register_attribute(__CALLER__.module, :excluded_props, accumulate: false)
    Module.register_attribute(__CALLER__.module, :overridable_value_for_props, accumulate: false)

    quote do
      import Astro.SurfaceComponent
      use Surface.LiveComponent, unquote(opts)
      @behaviour Astro.SurfaceComponent
      @before_compile Astro.SurfaceComponent

      @overridable_value_for_props []
      @excluded_props ~w(id classNames isDisabled)a

      @doc """
      Component classNames
      """
      prop classNames, :css_class

      @doc """
      Disable component
      """
      prop isDisabled, :boolean

      @doc """
      Inner body element
      """
      slot default

      defp get_class_name(:color, value) do
        Astro.color(value)
      end

      defp get_class_name(:gradient, value) do
        Astro.gradient(value)
      end

      defp get_class_name(:size, value) do
        Astro.size(value)
      end

      defp get_class_name(:isDisabled, value) when is_boolean(value) do
        value
      end

      defp get_props do
        props = __MODULE__.__props__()
        Enum.filter(props, &(&1.name not in @excluded_props))
      end

      defp build_css_class(prefix, class_name) do
        "#{prefix}--#{class_name}"
      end

      defoverridable get_class_name: 2
    end
  end

  defmacro __before_compile__(_) do
    quote do
      defp maybe_change_value(prop, value) do
        if Keyword.has_key?(@overridable_value_for_props, prop) do
          override = Keyword.fetch!(@overridable_value_for_props, prop)
          "#{override}-#{get_class_name(prop, value)}"
        else
          get_class_name(prop, value)
        end
      end

      @impl true
      def generate_class_names(assigns) do
        values =
          Enum.reduce(get_props(), [], fn %{name: prop}, acc ->
            value = Map.get(assigns, prop)

            if is_nil(value),
              do: acc,
              else: [
                build_css_class(@prefix, maybe_change_value(prop, value))
                | acc
              ]
          end)

        [@prefix | values]
        |> Enum.join(" ")
      end
    end
  end
end
