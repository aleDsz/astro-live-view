defmodule Astro do
  @moduledoc """
  Astro is a design system developed by Magnetis.

  This library provides LiveView components to use
  together with [@magnetis/astro](https://www.npmjs.com/package/@magnetis/astro) npm package.
  """

  @typep colors ::
           :earth
           | :venus
           | :uranus
           | :moon
           | :mars
           | :sun
           | :space

  @typep gradients ::
           :nebulosa
           | :andromeda
           | :sombrero
           | :milky_way
           | :hoag
           | :centaurus
           | :whirlpool
           | :cartwheel
           | :black_hole
           | :mayall
           | :pinwheel

  @typep sizes :: :small | :medium | :large

  @colors ~w(
    earth
    venus
    uranus
    moon
    mars
    sun
    space
  )a
  defguard is_color(color) when color in @colors

  @doc "Gets available colors"
  @spec colors() :: list(colors())
  def colors, do: @colors

  @gradients ~w(
    nebulosa
    andromeda
    sombrero
    milky_way
    hoag
    centaurus
    whirlpool
    cartwheel
    black_hole
    mayall
    pinwheel
  )a
  defguard is_gradient(gradient) when gradient in @gradients

  @doc "Gets available gradients"
  @spec gradients() :: list(gradients())
  def gradients, do: @gradients

  @sizes ~w(small medium large)a
  defguard is_size(size) when size in @sizes

  @doc "Gets available sizes"
  @spec sizes() :: list(sizes())
  def sizes, do: @sizes

  @doc """
  Gets color class name
  """
  @spec color(colors()) :: binary()
  def color(color_name) when is_color(color_name) do
    normalize_class(color_name)
  end

  def color(value), do: raise(Astro.Error, type: :color, value: value)

  @doc """
  Gets gradient color class name
  """
  @spec gradient(gradients()) :: binary()
  def gradient(gradient_name) when is_gradient(gradient_name) do
    normalize_class(gradient_name)
  end

  def gradient(value), do: raise(Astro.Error, type: :gradient, value: value)

  @doc """
  Gets size class name
  """
  @spec size(sizes()) :: binary()
  def size(size_name) when is_size(size_name) do
    normalize_class(size_name)
  end

  def size(value), do: raise(Astro.Error, type: :size, value: value)

  @doc """
  Normalizes atom into binary class name
  """
  @spec normalize_class(atom()) :: binary()
  def normalize_class(atom) do
    atom
    |> Atom.to_string()
    |> String.replace(~r/[_]+/, "-")
  end
end
