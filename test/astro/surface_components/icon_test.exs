defmodule Astro.SurfaceComponents.IconTest do
  use Astro.ComponentCase

  describe "render/1" do
    test "returns Icon component without properties" do
      assigns = %{}

      html =
        render_surface do
          ~H"""
          <Icon id="sample_icon">Sample</Icon>
          """
        end

      assert html =~ """
             <i class="a-icon"></i>
             """
    end

    test "returns Icon component with name property" do
      assigns = %{
        name: :heart
      }

      html =
        render_surface do
          ~H"""
          <Icon id="sample_icon" name={{ @name }} />
          """
        end

      assert html =~ """
             <i class="a-icon a-icon--heart"></i>
             """
    end

    test "returns Icon component with size property" do
      assigns = %{
        size: :large
      }

      html =
        render_surface do
          ~H"""
          <Icon id="sample_icon" size={{ @size }} />
          """
        end

      assert html =~ """
             <i class="a-icon a-icon--size-large"></i>
             """
    end

    test "returns Icon component with color and size properties" do
      assigns = %{
        size: :large,
        name: :x_men
      }

      html =
        render_surface do
          ~H"""
          <Icon id="sample_icon" size={{ @size }} name={{ @name }} />
          """
        end

      assert html =~ """
             <i class="a-icon a-icon--size-large a-icon--x-men"></i>
             """
    end

    test "returns Icon component with color, size and side properties" do
      assigns = %{
        side: :right,
        size: :large,
        name: :x_men
      }

      html =
        render_surface do
          ~H"""
          <Icon id="sample_icon" size={{ @size }} name={{ @name }} side={{ @side }} />
          """
        end

      assert html =~ """
             <i class="a-icon a-icon--space-right a-icon--size-large a-icon--x-men"></i>
             """
    end
  end
end
