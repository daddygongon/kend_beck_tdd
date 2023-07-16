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
      return @amount == money.amount &&
        self.class == object.class
    end
    def dollar
      return Dollar.new(@amount, 'USD')
    end
    def franc
      return Franc.new(@amount, 'CHF')
    end
  end
  class Dollar < Money
    def initialize(amount, currency)
      super(amount)
      @currency = 'USD'
    end
    def times(multiplier)
      return Dollar.new(@amount * multiplier, nil)
    end
  end
  class Franc < Money
    def initialize(amount, currency)
      super(amount)
      @currency = 'CHF'
    end
    def times(multiplier)
      return Franc.new(@amount * multiplier, nil)
    end
  end
end
