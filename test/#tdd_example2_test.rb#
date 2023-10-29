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
    five = Money.new(5).dollar
    sum = five.plus(five) # produce Sum
    bank = Bank.new
    reduce= bank.reduce(sum, 'USD')
    assert_true(Money.new(10).dollar.equals(reduce))
  end
  test "plus returns sum" do
    five = Money.new(5).dollar
    sum = Sum.new(five, five)
    assert_true(five.equals(sum.augend))
    assert_true(five.equals(sum.addend))
  end
  test "reduce money" do
    bank = Bank.new
    result = bank.reduce(Money.new(1).dollar, 'USD')
    assert_true(Money.new(1).dollar.equals(result))
  end
  test "reduce money different money" do
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    result = bank.reduce(Money.new(2).franc, 'USD')
    assert_true(Money.new(1).dollar.equals(result))
  end
  test "identity rate" do
    assert_equal(1.0, Bank.new.rate('USD', 'USD'))
  end
  test "mixed addition" do
    five_bucks = Money.new(5).dollar
    ten_francs = Money.new(10).franc
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)

    result = bank.reduce(five_bucks.plus(ten_francs), 'USD')
    assert_true(Money.new(10).dollar.equals(result))
  end
 
  test "hash test" do
    rate_table = {'USD'=>{'CHF'=>0.5, 'USD'=>1.0},
                  'CHF'=>{'CHF'=>1.0, 'USD'=>2.0}}
    from = 'CHF'
    to = 'USD'
    assert_equal(2.0, rate_table[from][to])
  end
end
