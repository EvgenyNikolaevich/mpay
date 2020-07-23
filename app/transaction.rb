# frozen_string_literal: true

class Transaction
  def save_payment(input)
    dataset.returning.insert(input).first
  end

  def dataset
    DB[:payments]
  end
end
