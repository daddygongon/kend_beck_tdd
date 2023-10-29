# frozen_string_literal: true

require_relative "tdd_example2/version"

module TddExample2
  class Error < StandardError; end

  class Pair
    def initialize(from, to)
      @from = from
      @to = to
    end
    
    def hashcode() = 0
      
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

  class Bank
    def initialize
      @rates = {}
    end

    def add_rate(from, to, rate)
      @rates[Pair.new(from, to).hashcode] = rate
    end

    def reduce(source, to) = source.reduce(self, to)

    def rate(from, to)
      return 1 if from == to
      return @rates[Pair.new(from, to).hashcode]
    end
  end

  class Money
    public attr_reader :amount, :currency
    
    def initialize(amount, currency=nil)
      @amount = amount
      @currency = currency
    end
    def reduce(bank, to)
      rate = bank.rate(@currency, to)
      return Money.new(@amount/rate, to) #self
    end

    def +(addend) = Sum.new(self, addend)
    
    def ==(object)
      return @amount == object.amount &&
        self.currency == object.currency
    end

    def dollar = Money.new(@amount, 'USD')
    def franc = Money.new(@amount, 'CHF')

    def times(multiplier)
      return Money.new(@amount * multiplier, @currency)
    end
  end
end
