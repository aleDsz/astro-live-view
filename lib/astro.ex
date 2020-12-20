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

  @typep icons :: dashboard_icons() | support_icons()

  @typep dashboard_icons ::
           :additional
           | :chart
           | :invite
           | :time
           | :down
           | :sheet
           | :chat
           | :flag
           | :transactions
           | :heart

  @typep support_icons ::
           :alert
           | :circle_check
           | :circle_down
           | :circle_up
           | :circle_left
           | :circle_right
           | :x_men
           | :copy
           | :info
           | :key
           | :logout
           | :mail
           | :menu
           | :phone
           | :profile
           | :clock
           | :arrow_down
           | :arrow_up
           | :arrow_left
           | :arrow_right
           | :download
           | :play
           | :locker
           | :magnifier
           | :sliders
           | :eye_open
           | :eye_closed
           | :pencil
           | :drop_down
           | :drop_up
           | :drop_left
           | :drop_right
           | :calendar
           | :pizza
           | :circle_mail
           | :configuration
           | :balloon
           | :warning
           | :photo
           | :document
           | :trash
           | :cake
           | :laptop
           | :coin
           | :cup
           | :house
           | :chart_up
           | :comparison
           | :circle_more
           | :circle_less
           | :light
           | :floater
           | :money_bag
           | :dollars
           | :bank
           | :tax
           | :calendar_check
           | :upload
           | :update
           | :return
           | :diagonal_left
           | :diagonal_right
           | :gift
           | :close
           | :mountain

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

  @icons ~w(
    additional
    chart
    invite
    time
    down
    sheet
    chat
    flag
    transactions
    heart
    alert
    circle_check
    circle_down
    circle_up
    circle_left
    circle_right
    x_men
    copy
    info
    key
    logout
    mail
    menu
    phone
    profile
    clock
    arrow_down
    arrow_up
    arrow_left
    arrow_right
    download
    play
    locker
    magnifier
    sliders
    eye_open
    eye_closed
    pencil
    drop_down
    drop_up
    drop_left
    drop_right
    calendar
    pizza
    circle_mail
    configuration
    balloon
    warning
    photo
    document
    trash
    cake
    laptop
    coin
    cup
    house
    chart_up
    comparison
    circle_more
    circle_less
    light
    floater
    money_bag
    dollars
    bank
    tax
    calendar_check
    upload
    update
    return
    diagonal_left
    diagonal_right
    gift
    close
    mountain
  )a
  defguard is_icon(icon) when icon in @icons

  @doc "Gets available icons"
  @spec icons() :: list(icons())
  def icons, do: @icons

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
  Gets icon class name
  """
  @spec icon(icons()) :: binary()
  def icon(icon_name) when is_icon(icon_name) do
    normalize_class(icon_name)
  end

  def icon(value), do: raise(Astro.Error, type: :icon, value: value)

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
