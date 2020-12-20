defmodule Astro.SurfaceComponents.IconLabelButtonTest do
  use Astro.ComponentCase

  describe "render/1" do
    test "throws Astro.Error exception when required property is undefined" do
      assigns = %{}

      assert_raise Astro.Error, "Icon is required but found nil value", fn ->
        render_surface do
          ~H"""
          <IconLabelButton id="sample_button">Sample</IconLabelButton>
          """
        end
      end
    end

    test "returns IconLabelButton component without properties" do
      assigns = %{
        icon: :heart
      }

      html =
        render_surface do
          ~H"""
          <IconLabelButton id="sample_button" icon={{ @icon }}>Sample</IconLabelButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--iconlabel">
               <i class="a-icon a-icon--space-left a-icon--heart"></i>
               Sample
             </button>
             """
    end

    test "returns IconLabelButton component with color property" do
      assigns = %{
        icon: :heart,
        color: :venus
      }

      html =
        render_surface do
          ~H"""
          <IconLabelButton id="sample_button" icon={{ @icon }} color={{ @color }}>Sample</IconLabelButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--venus a-btn--iconlabel">
               <i class="a-icon a-icon--space-left a-icon--heart"></i>
               Sample
             </button>
             """
    end

    test "returns IconLabelButton component with size property" do
      assigns = %{
        icon: :heart,
        size: :large
      }

      html =
        render_surface do
          ~H"""
          <IconLabelButton id="sample_button" icon={{ @icon }} size={{ @size }}>Sample</IconLabelButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--large a-btn--iconlabel">
               <i class="a-icon a-icon--space-left a-icon--heart"></i>
               Sample
             </button>
             """
    end

    test "returns IconLabelButton component with color and size properties" do
      assigns = %{
        icon: :heart,
        size: :large,
        color: :earth
      }

      html =
        render_surface do
          ~H"""
          <IconLabelButton id="sample_button" icon={{ @icon }} size={{ @size }} color={{ @color }}>Sample</IconLabelButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--large a-btn--earth a-btn--iconlabel">
               <i class="a-icon a-icon--space-left a-icon--heart"></i>
               Sample
             </button>
             """
    end

    test "returns disabled IconLabelButton component with color and size properties" do
      assigns = %{
        disabled: true,
        icon: :heart,
        size: :large,
        color: :earth
      }

      html =
        render_surface do
          ~H"""
          <IconLabelButton id="sample_button" icon={{ @icon }} disabled={{ @disabled }} size={{ @size }} color={{ @color }}>Sample</IconLabelButton>
          """
        end

      assert html =~ """
             <button disabled class="a-btn a-btn--large a-btn--earth a-btn--iconlabel">
               <i class="a-icon a-icon--space-left a-icon--heart"></i>
               Sample
             </button>
             """
    end

    test "returns IconLabelButton component with icon size and icon name properties" do
      assigns = %{
        icon_size: :medium,
        icon: :heart
      }

      html =
        render_surface do
          ~H"""
          <IconLabelButton id="sample_button" icon={{ @icon }} icon_size={{ @icon_size }}>Sample</IconLabelButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--iconlabel">
               <i class="a-icon a-icon--space-left a-icon--size-medium a-icon--heart"></i>
               Sample
             </button>
             """
    end
  end
end
