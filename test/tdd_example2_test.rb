# frozen_string_literal: true

require "test_helper"

class TddExample2Test < Test::Unit::TestCase
  include TddExample2
  test "VERSION" do
    assert do
      ::TddExample2.const_defined?(:VERSION)
    end
  end

  test "dollar multiplication" do
    five = Money.new(5).dollar

    #    assert_equal(Dollar.new(10), product)
    assert_true(Money.new(10).dollar.equals(five.times(2)))
    assert_true(Money.new(15).dollar.equals(five.times(3)))
  end

  test "equality" do
    assert_true(Money.new(5).dollar.equals(Money.new(5).dollar))
    assert_false(Money.new(5).dollar.equals(Money.new(6).dollar))
    assert_false(Money.new(5).franc.equals(Money.new(5).dollar))
  end

  test "currency" do
    assert_equal("USD", Money.new(1).dollar.currency)
    assert_equal("CHF", Money.new(1).franc.currency)
  end

  test "simple addition" do
    sum = Money.new(5).dollar.plus(Money.new(5).dollar)
    assert_true(Money.new(10).dollar.equals(sum))
  end
end
