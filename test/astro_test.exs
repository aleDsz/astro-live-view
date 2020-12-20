defmodule AstroTest do
  use Astro.Case

  describe "guards" do
    defmodule GuardTest do
      require Astro

      def is_color(value), do: Astro.is_color(value)
      def is_gradient(value), do: Astro.is_gradient(value)
      def is_size(value), do: Astro.is_size(value)
      def is_icon(value), do: Astro.is_icon(value)
    end

    test "is_color/1 should validate color" do
      assert GuardTest.is_color(:venus)
      refute GuardTest.is_color(:foobar)
    end

    test "is_gradient/1 should validate gradient" do
      assert GuardTest.is_gradient(:black_hole)
      refute GuardTest.is_gradient(:foobar)
    end

    test "is_size/1 should validate size" do
      assert GuardTest.is_size(:small)
      refute GuardTest.is_size(:foobar)
    end

    test "is_icon/1 should validate icon" do
      assert GuardTest.is_icon(:transactions)
      refute GuardTest.is_icon(:foobar)
    end
  end

  describe "colors/0" do
    test "returns a list of available colors" do
      assert colors = module().colors()
      assert length(colors) == 7
      assert :venus in colors
    end
  end

  describe "gradients/0" do
    test "returns a list of available gradients" do
      assert gradients = module().gradients()
      assert length(gradients) == 11
      assert :black_hole in gradients
    end
  end

  describe "sizes/0" do
    test "returns a list of available sizes" do
      assert [:small, :medium, :large] = module().sizes()
    end
  end

  describe "icons/0" do
    test "returns a list of available icons" do
      assert icons = module().icons()
      assert length(icons) == 75
      assert :x_men in icons
    end
  end

  describe "color/1" do
    test "returns a color class from given color atom" do
      assert "venus" == module().color(:venus)
    end

    test "returns error when given color atom is invalid" do
      assert_raise Astro.Error, fn -> module().color(:foobar) end
    end
  end

  describe "gradient/1" do
    test "returns a gradient class from given gradient atom" do
      assert "andromeda" == module().gradient(:andromeda)
    end

    test "returns a gradient class from given underscored gradient atom" do
      assert "black-hole" == module().gradient(:black_hole)
    end

    test "returns error when given gradient atom is invalid" do
      assert_raise Astro.Error, fn -> module().gradient(:foobar) end
    end
  end

  describe "size/1" do
    test "returns a size class from given size atom" do
      assert "small" == module().size(:small)
    end

    test "returns error when given size atom is invalid" do
      assert_raise Astro.Error, fn -> module().size(:foobar) end
    end
  end

  describe "icon/1" do
    test "returns a icon class from given icon atom" do
      assert "heart" == module().icon(:heart)
    end

    test "returns a icon class from given underscored icon atom" do
      assert "arrow-up" == module().icon(:arrow_up)
    end

    test "returns error when given icon atom is invalid" do
      assert_raise Astro.Error, fn -> module().icon(:foobar) end
    end
  end

  describe "normalize_class/1" do
    test "returns a normalized class from given atom" do
      assert "foobar" == module().normalize_class(:foobar)
    end

    test "returns a normalized class from given underscored atom" do
      assert "foobar-test" == module().normalize_class(:foobar_test)
    end

    test "returns error when given argument isn't atom" do
      assert_raise ArgumentError, fn -> module().normalize_class("foobar") end
    end
  end
end
