# frozen_string_literal: true

require "test_helper"

class TddExample2Test < Test::Unit::TestCase
  include TddExample2
  test "VERSION" do
    assert do
      ::TddExample2.const_defined?(:VERSION)
    end
  end

  test "something useful" do
    #    assert_equal("expected", "actual")
    assert_equal("expected", "expected")
  end

  test "mixed addition" do
    five_bucks = Money.new(5).dollar
    ten_franc = Money.new(10).franc
    bank = Bank.new()
    bank.add_rate('CHF', 'USD', 2)
    result = bank.reduce(five_bucks + ten_franc, 'USD')
    assert_equal(Money.new(10).dollar, result)
  end

  test "identity rate" do
    assert_equal(1, Bank.new.rate('USD', 'USD'))
  end

  test "plus returns sum" do
    five = Money.new(5).dollar
    sum = five + five # expression
    assert_equal(five, sum.augend)
    assert_equal(five, sum.addend)
  end

  test "reduce money different currency" do
    bank = Bank.new()
    bank.add_rate('CHF', 'USD', 2)
    result = bank.reduce(Money.new(2).franc, 'USD')
    assert_equal(Money.new(1).dollar, result)
  end

  test "bank returns reduce sum" do
    three_bucks = Money.new(3).dollar
    four_bucks = Money.new(4).dollar
    sum = Sum.new(three_bucks, four_bucks) # expression
    bank = Bank.new()
    result = bank.reduce(sum, 'USD')
    assert_equal(Money.new(7).dollar, result)
  end

  test "reduce money" do
    bank = Bank.new()
    result = bank.reduce(Money.new(1).dollar, 'USD')
    assert_equal(Money.new(1).dollar, result)
  end

  test "simple addition" do
    five = Money.new(5).dollar
    sum = five + five # expression
    bank = Bank.new
    reduced = bank.reduce(sum, 'USD')
    assert_equal(Money.new(10).dollar, reduced)
  end

  test "currency" do
    assert_equal 'USD',  Money.new(1).dollar.currency
    assert_equal 'CHF',  Money.new(1).franc.currency
  end

  test "equality" do
    assert_true  Money.new(5).dollar == Money.new(5).dollar
    assert_false Money.new(5).dollar == Money.new(6).dollar
    assert_true  Money.new(5).franc == Money.new(5).franc
    assert_false Money.new(5).franc == Money.new(6).franc
    assert_false Money.new(5).franc == Money.new(5).dollar
  end

  test "multiplication" do
    five = Money.new(5).dollar
    assert_true Money.new(10).dollar == five.times(2)
    assert_true Money.new(15).dollar == five.times(3)
  end

  test "Franc multiplication" do
    five = Money.new(5).franc
    assert_true Money.new(10).franc == five.times(2)
    assert_true Money.new(15).franc == five.times(3)
  end
end
