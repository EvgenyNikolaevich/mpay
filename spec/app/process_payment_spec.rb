# frozen_string_literal: true

describe ProcessPayment do
  subject(:call) { described_class.new.call }

  context '.call' do
    it { is_expected.to eq nil }
  end
end
