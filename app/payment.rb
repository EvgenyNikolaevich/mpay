# frozen_string_literal: true

class Payment
  def initialize; end

  def create(input)
    valid_data      = Validator.call(input)
    saved_payment   = Transaction.save_payment(valid_data)
    prepare_payment = PreparePayment.call(saved_payment)
    self
  end
end
