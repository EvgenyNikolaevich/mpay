# frozen_string_literal: true

describe PreparePayment do
  let(:prepare_payment) { described_class.new }
  let(:uid)             { SecureRandom.uuid }
  let(:url)             { APP_CONF['services']['mpay']['url'] + '/v1.0/invoices' }
  let(:headers)         { { content_type: :json } }
  let(:input) do
    {
      uid: uid,
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

  let(:expected_body) do
    {
      currency: 'USD',
      amount: 100,
      name: 'Amarkets payment',
      description: uid
    }
  end

  describe '.call' do
    subject(:call) { prepare_payment.call(input) }
    before { stub_const('APP_CONF', 'services' => { 'mpay' => { 'url' => 'not_nil' }}) }

    context 'return prepared hash' do
      it { is_expected.to be_an_instance_of(Hash) }

      context 'with url' do
        subject(:url) { call[:url] }

        it { is_expected.to eq(url) }
      end

      context 'body' do
        subject(:body) { call[:body] }

        it { is_expected.to be_an_instance_of(Hash) }
        it { is_expected.to eq(expected_body) }
      end

      context 'and headers' do
        subject(:headers) { call[:headers] }

        it { is_expected.to be_an_instance_of(Hash) }
        it { is_expected.to eq(headers)}
      end
    end
  end
end
