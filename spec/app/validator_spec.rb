# frozen_string_literal: true

describe Validator do
  let(:validator) { described_class.new }
  let(:money)     { build(:money) }
  let(:uuid)      { SecureRandom.uuid }
  let(:webhooks)  do
    {
      on_success: {
        url: 'https://www.example.com'
      },
      on_fail: {
        url: 'https://www.example.com'
      },
      callback: {
        url: 'https://www.example.com'
      }
    }
  end

  let(:input) do
    {
      data: {
        id: uuid,
        type: 'Payment',
        attributes: {
          account: {
            uid: uuid,
            type: 'Wallet'
          },
          charge: {
            fractional: money.fractional,
            currency: money.currency.to_s
          },
          webhooks: webhooks
        }
      }
    }
  end

  subject(:call) { validator.call(input) }

  describe '.call' do
    it { is_expected.to be_an_instance_of Dry::Validation::Result }
    it { expect(call.errors).to be_empty }
  end
end
