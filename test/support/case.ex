defmodule Astro.Case do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    module = Astro.Case.get_lib_module(__MODULE__)

    quote do
      alias unquote(module)

      defp module do
        Astro.Case.get_lib_module(__MODULE__)
      end
    end
  end

  def get_lib_module(module) do
    splitted_module = Module.split(module)
    renamed_module = rename_module(splitted_module, [])
    Module.safe_concat(renamed_module)
  end

  defp rename_module([], _), do: []

  defp rename_module([name], acc) do
    acc =
      if String.ends_with?(name, "Test") do
        [String.replace(name, ~r/Test+$/, "") | acc]
      else
        [name | acc]
      end

    Enum.reverse(acc)
  end

  defp rename_module([name | remaining], acc) do
    rename_module(remaining, [name | acc])
  end
end
