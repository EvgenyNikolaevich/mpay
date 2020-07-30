# frozen_string_literal: true

describe PreparePayment do
  let(:prepare_payment) { described_class.new }
  let(:uid)             { SecureRandom.uuid }
  let(:url)             { APP_CONF['services']['mpay']['url'] + '/v1.0/invoices' }
  let(:input) do
    {
      account_uid: uid,
      account_type: 'RealAccount',
      currency: 'USD',
      fractional: 10_000,
      success_url: 'https://www.example.com',
      fail_url: 'https://www.example.com',
      callback_url: 'https://www.example.com',
      status: 'new'
    }
  end

  describe '.call' do
    subject(:call) { prepare_payment.call(input) }
    before { stub_const('APP_CONF', 'services' => { 'mpay' => { 'url' => 'not_nil' }}) }

    context 'call return prepared url, body and headers' do
      it { is_expected.to be_an_instance_of(Hash) }
      it { expect(call[:url]).to eq(url) }
      # it { expect(call[:body]).to eq(Hash) }
      # it { expect(call[:headers]).to eq(Hash) }
    end
  end
end
