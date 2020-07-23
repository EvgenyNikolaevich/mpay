# frozen_string_literal: true

describe Transaction do
  let(:transaction) { described_class.new }
  let(:input) do
    {
      account_uid: SecureRandom.uuid,
      account_type: 'RealAccount',
      currency: 'USD',
      fractional: 10_000,
      success_url: 'https://www.example.com',
      fail_url: 'https://www.example.com',
      callback_url: 'https://www.example.com',
      status: 'new'
    }
  end

  describe '.save_payment' do
    subject(:save_payment) { transaction.save_payment(input) }

    context 'insert to DB successfully' do
      it { is_expected.to be_an_instance_of(Hash) }
      #it { expect(save_payment[:uid]).to be eq(input[:uid]) }
      it { expect(save_payment[:currency]).to eq(input[:currency]) }
      it { expect(save_payment[:fractional]).to eq(input[:fractional]) }
      it { expect(save_payment[:status]).to eq(input[:status]) }
    end
  end
end
