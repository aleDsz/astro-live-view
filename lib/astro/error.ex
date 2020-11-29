defmodule Astro.Error do
  defexception message: "is invalid", type: nil, value: nil

  def message(%__MODULE__{message: message, type: nil, value: nil}) do
    message
  end

  def message(%__MODULE__{message: message, type: nil, value: value}) do
    "#{inspect(value)} #{message}"
  end

  def message(%__MODULE__{message: message, type: type, value: nil}) do
    "#{transform_type(type)} #{message}"
  end

  def message(%__MODULE__{message: message, type: type, value: value}) do
    "#{transform_type(type)} with value #{inspect(value)} #{message}"
  end

  defp transform_type(atom) do
    atom
    |> Atom.to_string()
    |> String.replace(~r/[_]+/, " ")
    |> String.capitalize()
  end
end
