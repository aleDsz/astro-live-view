defmodule Astro.SurfaceComponents.PrimaryButtonTest do
  use Astro.ComponentCase

  describe "render/1" do
    test "returns PrimaryButton component without properties" do
      assigns = %{}

      html =
        render_surface do
          ~H"""
          <PrimaryButton id="sample_button">Sample</PrimaryButton>
          """
        end

      assert html =~ """
             <button class="a-btn">
               Sample
             </button>
             """
    end

    test "returns PrimaryButton component with color property" do
      assigns = %{
        color: :venus
      }

      html =
        render_surface do
          ~H"""
          <PrimaryButton id="sample_button" color={{ @color }}>Sample</PrimaryButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--venus">
               Sample
             </button>
             """
    end

    test "returns PrimaryButton component with size property" do
      assigns = %{
        size: :large
      }

      html =
        render_surface do
          ~H"""
          <PrimaryButton id="sample_button" size={{ @size }}>Sample</PrimaryButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--large">
               Sample
             </button>
             """
    end

    test "returns PrimaryButton component with color and size properties" do
      assigns = %{
        size: :large,
        color: :earth
      }

      html =
        render_surface do
          ~H"""
          <PrimaryButton id="sample_button" size={{ @size }} color={{ @color }}>Sample</PrimaryButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--large a-btn--earth">
               Sample
             </button>
             """
    end

    test "returns disabled PrimaryButton component with color and size properties" do
      assigns = %{
        disabled: true,
        size: :large,
        color: :earth
      }

      html =
        render_surface do
          ~H"""
          <PrimaryButton id="sample_button" disabled={{ @disabled }} size={{ @size }} color={{ @color }}>Sample</PrimaryButton>
          """
        end

      assert html =~ """
             <button disabled class="a-btn a-btn--large a-btn--earth">
               Sample
             </button>
             """
    end

    test "returns PrimaryButton component with color and size properties and additional classNames (string)" do
      assigns = %{
        size: :large,
        color: :earth,
        classNames: "test container"
      }

      html =
        render_surface do
          ~H"""
          <PrimaryButton id="sample_button" classNames={{ @classNames }} size={{ @size }} color={{ @color }}>Sample</PrimaryButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--large a-btn--earth test container">
               Sample
             </button>
             """
    end

    test "returns PrimaryButton component with color and size properties and additional classNames (list)" do
      assigns = %{
        size: :large,
        color: :earth,
        classNames: ["test", "container"]
      }

      html =
        render_surface do
          ~H"""
          <PrimaryButton id="sample_button" classNames={{ @classNames }} size={{ @size }} color={{ @color }}>Sample</PrimaryButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--large a-btn--earth test container">
               Sample
             </button>
             """
    end
  end
end
