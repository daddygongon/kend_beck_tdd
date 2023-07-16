# frozen_string_literal: true

require_relative "tdd_example2/version"

module TddExample2
  class Error < StandardError; end
  # Your code goes here...
  class Sum
    public attr_reader :augend, :addend
    def initialize(augend, addend)
      @augend = augend
      @addend = addend
    end
    def reduce(to)
      amount = @augend.amount + @addend.amount
      return Money.new(amount,to)
    end
  end
  class Bank
    def reduce(source, to)
=begin      
      if source.class == Money
        return source.reduce(to)
      end
      sum = source
      return sum.reduce(to)
=end
      return source.reduce(to)
    end
  end
  class Money
    public attr_reader :amount
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
      return Sum.new(self, addend)
    end
    def reduce(to)
      return self
    end
  end
end
