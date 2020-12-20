defmodule Astro.ErrorTest do
  use Astro.Case

  test "returns valid message without parameters" do
    assert_raise module(), "is invalid", fn -> raise module() end
  end

  test "returns valid required property message" do
    assert_raise module(), "Property is required but found nil value", fn ->
      raise module(), required: true
    end
  end

  test "returns valid required property message with given type" do
    assert_raise module(), "Icon is required but found nil value", fn ->
      raise module(), required: true, type: :icon
    end
  end

  test "returns valid message with given type" do
    assert_raise module(), "Test is invalid", fn -> raise module(), type: :test end
  end

  test "returns valid message with given underscored type" do
    assert_raise module(), "Underscored test is invalid", fn ->
      raise module(), type: :underscored_test
    end
  end

  test "returns valid message with given string value" do
    assert_raise module(), ~s("test" is invalid), fn ->
      raise module(), value: "test"
    end
  end

  test "returns valid message with given map value" do
    assert_raise module(), ~s(%{"value" => "123"} is invalid), fn ->
      raise module(), value: %{"value" => "123"}
    end
  end

  test "returns valid message with given type and value" do
    assert_raise module(), ~s(Color with value :foobar is invalid), fn ->
      raise module(), type: :color, value: :foobar
    end
  end
end
