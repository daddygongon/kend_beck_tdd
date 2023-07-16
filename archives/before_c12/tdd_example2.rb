# frozen_string_literal: true

require_relative "tdd_example2/version"

module TddExample2
  class Error < StandardError; end
  # Your code goes here...
  class Money
    protected attr_reader :amount
    public attr_reader :currency
    def initialize(amount, currency=nil)
      @amount = amount
      @currency = currency
    end
    def equals(object)
      money = Money.new(object.amount)
#      p [object, money, self]
      return @amount == money.amount &&
        #        self.class == object.class
        self.currency == object.currency
    end
    def dollar
      return Money.new(@amount, 'USD')
    end
    def franc
      return Money.new(@amount, 'CHF')
    end
    def times(multiplier)
      return Money.new(@amount * multiplier, @currency)
    end
    def plus(addend)
      return Money.new(@amount+addend.amount, @currency)
    end
  end
end
