defmodule Astro.SurfaceComponents.OutlineButtonTest do
  use Astro.ComponentCase

  describe "render/1" do
    test "returns OutlineButton component without properties" do
      assigns = %{}

      html =
        render_surface do
          ~H"""
          <OutlineButton id="sample_button">Sample</OutlineButton>
          """
        end

      assert html =~ """
             <button class="a-btn">
               Sample
             </button>
             """
    end

    test "returns OutlineButton component with color property" do
      assigns = %{
        color: :venus
      }

      html =
        render_surface do
          ~H"""
          <OutlineButton id="sample_button" color={{ @color }}>Sample</OutlineButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--outline-venus">
               Sample
             </button>
             """
    end

    test "returns OutlineButton component with size property" do
      assigns = %{
        size: :large
      }

      html =
        render_surface do
          ~H"""
          <OutlineButton id="sample_button" size={{ @size }}>
            Sample
          </OutlineButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--large">
               Sample
             </button>
             """
    end

    test "returns OutlineButton component with color and size properties" do
      assigns = %{
        size: :large,
        color: :earth
      }

      html =
        render_surface do
          ~H"""
          <OutlineButton id="sample_button" size={{ @size }} color={{ @color }}>Sample</OutlineButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--large a-btn--outline-earth">
               Sample
             </button>
             """
    end

    test "returns disabled OutlineButton component with color and size properties" do
      assigns = %{
        disabled: true,
        size: :large,
        color: :earth
      }

      html =
        render_surface do
          ~H"""
          <OutlineButton id="sample_button" disabled={{ @disabled }} size={{ @size }} color={{ @color }}>Sample</OutlineButton>
          """
        end

      assert html =~ """
             <button disabled class="a-btn a-btn--large a-btn--outline-earth">
               Sample
             </button>
             """
    end
  end
end
