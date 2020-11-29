defmodule Astro.SurfaceComponents.ButtonTest do
  use Astro.ComponentCase

  describe "render/1" do
    test "returns Button component without button properties" do
      html = """
      <button class="a-btn">Sample</button>
      """

      assert render_component(module(), %{children: "Sample"}) =~ html
    end

    test "returns Button component without color property" do
      html = """
      <button class="a-btn a-btn--venus">Sample</button>
      """

      assert render_component(module(), %{color: :venus, children: "Sample"}) =~
               html
    end
  end
end
