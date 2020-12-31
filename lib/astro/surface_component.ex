defmodule Astro.SurfaceComponent do
  @moduledoc """
  Astro interface to integrate with Surface library
  """
  @callback get_class_name(atom(), any()) :: binary()
  @callback generate_class_names(Phoenix.LiveView.Socket.assigns()) :: binary()

  @optional_callbacks get_class_name: 2

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
      @excluded_props ~w(id classNames disabled)a

      @doc """
      Additional css classes
      """
      prop classNames, :css_class

      @doc """
      Disable component
      """
      prop disabled, :boolean

      @doc """
      Inner body element
      """
      slot default

      defp build_css_class(prefix, class_name) when is_nil(class_name) or class_name == "" do
        nil
      end

      defp build_css_class(prefix, class_name) do
        "#{prefix}--#{class_name}"
      end
    end
  end

  defmacro __before_compile__(_) do
    quote do
      defp get_props do
        props = __MODULE__.__props__()
        Enum.filter(props, &(&1.name not in @excluded_props))
      end

      defp maybe_change_value(prop, value) do
        if Keyword.has_key?(@overridable_value_for_props, prop) do
          override = Keyword.fetch!(@overridable_value_for_props, prop)
          value = get_class_name(__MODULE__, prop, value)

          case override do
            {^value, override} ->
              String.replace(override, "{#{prop}}", value)

            {_, _} ->
              nil

            override ->
              String.replace(override, "{#{prop}}", value)
          end
        else
          get_class_name(__MODULE__, prop, value)
        end
      end

      defp validate_class_names(assigns) do
        classes =
          Enum.reduce(get_props(), [], fn %{name: prop, opts: opts} = x, acc ->
            value = Map.get(assigns, prop)
            required = Keyword.get(opts, :required, false)
            validate_prop(prop, value, required, acc)
          end)

        additional_classes = Map.get(assigns, :classNames)

        if is_nil(additional_classes),
          do: classes,
          else: classes ++ additional_classes
      end

      defp validate_prop(prop, value, required, acc) do
        cond do
          (is_nil(required) or required == false) and is_nil(value) ->
            acc

          required and is_nil(value) ->
            raise Astro.Error, type: prop, required: true

          true ->
            css_class = build_css_class(@prefix, maybe_change_value(prop, value))

            if is_nil(css_class),
              do: acc,
              else: [css_class | acc]
        end
      end

      @impl true
      def generate_class_names(assigns) do
        values = validate_class_names(assigns)

        [@prefix | values]
        |> Enum.join(" ")
      end
    end
  end

  @doc """
  Transform atom value into css class value
  """
  @spec get_class_name(module(), atom(), any()) :: binary()
  def get_class_name(_, :color, value) do
    Astro.color(value)
  end

  def get_class_name(_, :gradient, value) do
    Astro.gradient(value)
  end

  def get_class_name(_, :size, value) do
    Astro.size(value)
  end

  def get_class_name(_, :icon, value) do
    Astro.icon(value)
  end

  def get_class_name(module, prop, value) do
    module.get_class_name(prop, value)
  end
end
