# frozen_string_literal: true

class Payment
  def initialize; end

  def create(input)
    valid_data        = Validator.new.call(input)
    saved_payment     = Transaction.save_payment(valid_data)
    prepared_payment  = PreparePayment.call(saved_payment)
    processed_payment = ProcessPayment.call(prepared_payment)
    self
  end
end
