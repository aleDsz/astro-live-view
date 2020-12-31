defmodule Astro.SurfaceComponents.LinkButtonTest do
  use Astro.ComponentCase

  describe "render/1" do
    test "returns LinkButton component without properties" do
      assigns = %{}

      html =
        render_surface do
          ~H"""
          <LinkButton id="sample_button">Sample</LinkButton>
          """
        end

      assert html =~ """
             <a class="a-btn">
               Sample
             </a>
             """
    end

    test "returns LinkButton component with color property" do
      assigns = %{
        color: :venus
      }

      html =
        render_surface do
          ~H"""
          <LinkButton id="sample_button" color={{ @color }}>Sample</LinkButton>
          """
        end

      assert html =~ """
             <a class="a-btn a-btn--venus">
               Sample
             </a>
             """
    end

    test "returns LinkButton component with size property" do
      assigns = %{
        size: :large
      }

      html =
        render_surface do
          ~H"""
          <LinkButton id="sample_button" size={{ @size }}>Sample</LinkButton>
          """
        end

      assert html =~ """
             <a class="a-btn a-btn--large">
               Sample
             </a>
             """
    end

    test "returns LinkButton component with color and size properties" do
      assigns = %{
        size: :large,
        color: :earth
      }

      html =
        render_surface do
          ~H"""
          <LinkButton id="sample_button" size={{ @size }} color={{ @color }}>Sample</LinkButton>
          """
        end

      assert html =~ """
             <a class="a-btn a-btn--large a-btn--earth">
               Sample
             </a>
             """
    end

    test "returns disabled LinkButton component with color and size properties" do
      assigns = %{
        disabled: true,
        size: :large,
        color: :earth
      }

      html =
        render_surface do
          ~H"""
          <LinkButton id="sample_button" disabled={{ @disabled }} size={{ @size }} color={{ @color }}>Sample</LinkButton>
          """
        end

      assert html =~ """
             <a class="a-btn a-btn--large a-btn--earth a-btn--disabled">
               Sample
             </a>
             """
    end

    test "returns LinkButton component with color and size properties and additional classNames (string)" do
      assigns = %{
        size: :large,
        color: :earth,
        classNames: "test container"
      }

      html =
        render_surface do
          ~H"""
          <LinkButton id="sample_button" classNames={{ @classNames }} size={{ @size }} color={{ @color }}>Sample</LinkButton>
          """
        end

      assert html =~ """
             <a class="a-btn a-btn--large a-btn--earth test container">
               Sample
             </a>
             """
    end

    test "returns LinkButton component with color and size properties and additional classNames (list)" do
      assigns = %{
        size: :large,
        color: :earth,
        classNames: ["test", "container"]
      }

      html =
        render_surface do
          ~H"""
          <LinkButton id="sample_button" classNames={{ @classNames }} size={{ @size }} color={{ @color }}>Sample</LinkButton>
          """
        end

      assert html =~ """
             <a class="a-btn a-btn--large a-btn--earth test container">
               Sample
             </a>
             """
    end

    test "returns LinkButton component with href property" do
      html =
        render_surface do
          ~H"""
          <LinkButton id="sample_button" href="http://example.com">Sample</LinkButton>
          """
        end

      assert html =~ """
             <a href="http://example.com" class="a-btn">
               Sample
             </a>
             """
    end

    test "returns LinkButton component with href and target properties" do
      html =
        render_surface do
          ~H"""
          <LinkButton id="sample_button" href="http://example.com" target="_blank">Sample</LinkButton>
          """
        end

      assert html =~ """
             <a href="http://example.com" target="_blank" class="a-btn">
               Sample
             </a>
             """
    end
  end
end
