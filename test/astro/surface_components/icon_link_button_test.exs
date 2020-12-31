defmodule Astro.SurfaceComponents.IconLinkButtonTest do
  use Astro.ComponentCase

  describe "render/1" do
    test "throws Astro.Error exception when required property is undefined" do
      assigns = %{}

      assert_raise Astro.Error, "Icon is required but found nil value", fn ->
        render_surface do
          ~H"""
          <IconLinkButton id="sample_button">Sample</IconLinkButton>
          """
        end
      end
    end

    test "returns IconLinkButton component without properties" do
      assigns = %{
        icon: :heart
      }

      html =
        render_surface do
          ~H"""
          <IconLinkButton id="sample_button" icon={{ @icon }}>Sample</IconLinkButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--iconlink">
               <i class="a-icon a-icon--heart"></i>
               Sample
             </button>
             """
    end

    test "returns IconLinkButton component with color property" do
      assigns = %{
        icon: :heart,
        color: :venus
      }

      html =
        render_surface do
          ~H"""
          <IconLinkButton id="sample_button" icon={{ @icon }} color={{ @color }}>Sample</IconLinkButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--venus a-btn--iconlink">
               <i class="a-icon a-icon--heart"></i>
               Sample
             </button>
             """
    end

    test "returns IconLinkButton component with size property" do
      assigns = %{
        icon: :heart,
        size: :large
      }

      html =
        render_surface do
          ~H"""
          <IconLinkButton id="sample_button" icon={{ @icon }} size={{ @size }}>Sample</IconLinkButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--large a-btn--iconlink">
               <i class="a-icon a-icon--heart"></i>
               Sample
             </button>
             """
    end

    test "returns IconLinkButton component with color and size properties" do
      assigns = %{
        icon: :heart,
        size: :large,
        color: :earth
      }

      html =
        render_surface do
          ~H"""
          <IconLinkButton id="sample_button" icon={{ @icon }} size={{ @size }} color={{ @color }}>Sample</IconLinkButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--large a-btn--earth a-btn--iconlink">
               <i class="a-icon a-icon--heart"></i>
               Sample
             </button>
             """
    end

    test "returns disabled IconLinkButton component with color and size properties" do
      assigns = %{
        disabled: true,
        icon: :heart,
        size: :large,
        color: :earth
      }

      html =
        render_surface do
          ~H"""
          <IconLinkButton id="sample_button" icon={{ @icon }} disabled={{ @disabled }} size={{ @size }} color={{ @color }}>Sample</IconLinkButton>
          """
        end

      assert html =~ """
             <button disabled class="a-btn a-btn--large a-btn--earth a-btn--iconlink">
               <i class="a-icon a-icon--heart"></i>
               Sample
             </button>
             """
    end

    test "returns IconLinkButton component with icon size and icon name properties" do
      assigns = %{
        icon_size: :medium,
        icon: :heart
      }

      html =
        render_surface do
          ~H"""
          <IconLinkButton id="sample_button" icon={{ @icon }} icon_size={{ @icon_size }}>Sample</IconLinkButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--iconlink">
               <i class="a-icon a-icon--size-medium a-icon--heart"></i>
               Sample
             </button>
             """
    end

    test "returns IconLinkButton component with right icon, icon size and icon name properties" do
      assigns = %{
        right_icon: true,
        icon_size: :medium,
        icon: :heart
      }

      html =
        render_surface do
          ~H"""
          <IconLinkButton id="sample_button" right_icon={{ @right_icon }} icon={{ @icon }} icon_size={{ @icon_size }}>Sample</IconLinkButton>
          """
        end

      assert html =~ """
             <button class="a-btn a-btn--iconlink-right a-btn--iconlink">
               Sample
               <i class="a-icon a-icon--size-medium a-icon--heart"></i>
             </button>
             """
    end
  end
end
