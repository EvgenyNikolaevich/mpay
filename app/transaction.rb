# frozen_string_literal: true

# class for working with table payments
class Transaction
  class << self
    def save_payment(input)
      payments.returning.insert(input).first
    end

    private

    def payments
      DB[:payments]
    end
  end
end
