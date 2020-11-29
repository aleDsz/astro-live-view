defmodule Astro.SurfaceComponent do
  @moduledoc """
  Astro interface to integrate with Surface library
  """
  @callback generate_class_names() :: binary()
  @callback generate_class_names(binary()) :: binary()

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

    quote do
      import Astro.SurfaceComponent
      use Surface.LiveComponent, unquote(opts)
      @behaviour Astro.SurfaceComponent
      @before_compile Astro.SurfaceComponent

      @doc """
      Component classNames
      """
      prop classes, :string, default: "", required: true

      @doc """
      Inner body element
      """
      data children, :any

      @impl true
      def mount(socket) do
        {:ok, assign(socket, classes: generate_class_names())}
      end

      defp get_props do
        props = __MODULE__.__props__()
        Enum.filter(props, &(&1.name not in [:id, :children, :classes]))
      end

      defp get_class_name(:color, value) do
        Astro.color(value)
      end

      defp get_class_name(:gradient, value) do
        Astro.gradient(value)
      end

      defp get_class_name(:size, value) do
        Astro.size(value)
      end

      defoverridable get_props: 0
      defoverridable get_class_name: 2
    end
  end

  defmacro __before_compile__(%{module: _module}) do
    quote do
      defp get_prop_value(name) do
        # code =
        #  quote do
        #    unquote("@#{name}")
        #  end
        :foobar
      end

      @impl true
      def generate_class_names(prefix \\ @prefix) do
        props = get_props()

        css =
          Enum.reduce(props, [], fn %{name: prop, func: :prop}, acc ->
            prop_value = get_prop_value(prop)

            if not is_nil(prop_value) do
              css = get_class_name(prop, prop_value)
              ["#{prefix}-#{css}" | acc]
            else
              acc
            end
          end)

        [prefix | css]
        |> Enum.join(" ")
      end

      defoverridable generate_class_names: 0
    end
  end
end
