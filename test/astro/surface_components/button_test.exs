defmodule Astro.SurfaceComponents.ButtonTest do
  use Astro.ComponentCase

  defmodule View do
    use Surface.LiveView
    alias Astro.SurfaceComponents.Button

    def render(assigns) do
      ~H"""
      <Button id="button">Sample</Button>
      """
    end
  end

  describe "render/1" do
    test "returns Button component without properties" do
      {:ok, _view, rendered_html} = live_isolated(build_conn(), View)

      expected_html =
        """
        <button data-phx-component=\"1\" class=\"a-btn\">Sample</button> 
        """

      assert_html(rendered_html =~ expected_html)
    end
  end
end
