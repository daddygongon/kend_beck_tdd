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
    def reduce(bank, to)
      amount = @augend.reduce(bank, to).amount +
               @addend.reduce(bank, to).amount
      return Money.new(amount,to)
    end
  end
  class Pair
    def initialize(from, to)
      @from = from
      @to = to
    end
    def hash_code()
      return 0
    end 
 end
  class Bank
    def initialize
      @rates = {}
    end
    def add_rate(from, to, rate)
      @rates.store(Pair.new(from,to).hash_code, rate)
    end
    def reduce(source, to)
      return source.reduce(self, to)
    end
    def rate(from, to)
      return 1.0 if from==to
      return @rates[Pair.new(from,to).hash_code]
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
        @currency == object.currency
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
    def reduce(bank, to)
      rate = bank.rate(@currency, to)
      return Money.new(@amount/rate, to)
    end
  end
end
