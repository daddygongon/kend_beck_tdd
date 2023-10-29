# frozen_string_literal: true

require_relative "tdd_example2/version"

module TddExample2
  class Error < StandardError; end
  # Your code goes here...
  class Pair
    def initialize(from, to)
      @from = from
      @to = to
    end
=begin
    def equals(object)
      pair = Pair.new(object)
      return from.equals(pair.from) && to.equals(pair.to)
    end
=end
    def hashcode()
      return 0
    end
  end
  class Sum
    attr_reader :augend, :addend
    def initialize(augend, addend)
      @augend = augend
      @addend = addend
    end
    def reduce(bank, to)
      amount = @augend.reduce(bank, to).amount +
               @addend.reduce(bank, to).amount
      return Money.new(amount, to)
    end
  end
  module Expression
    # Ruby implementation of Java's interface, but ...
  end
  class Bank
    def initialize
      @rates = {}
    end

    # include Expression
    def add_rate(from, to, rate)
      @rates[Pair.new(from, to).hashcode] = rate
    end
    def reduce(source, to)
=begin
      if source.class == Money
        return source.reduce(to)
      end
      sum = source # not new
=end
      return source.reduce(self, to) #Money.new(10).dollar
    end
    def rate(from, to)
      return 1 if from == to
      return @rates[Pair.new(from, to).hashcode]
#      return (from=='CHF' && to=='USD') ? 2 : 1
    end
  end
  class Money
    public attr_reader :amount
    public attr_reader :currency
    
    def initialize(amount, currency=nil)
      @amount = amount
      @currency = currency
    end
    def reduce(bank, to)
      rate = bank.rate(@currency, to)
      return Money.new(@amount/rate, to) #self
    end
    def +(addend)
      return Sum.new(self, addend)
#      return Money.new(@amount + addend.amount, currency)
    end
    
    def ==(object)
      money = object
      return @amount == money.amount &&
        self.currency == money.currency
    end

    def dollar = Money.new(@amount, 'USD')
    def franc = Money.new(@amount, 'CHF')

    def times(multiplier)
      return Money.new(@amount * multiplier, @currency)
    end
  end
end
