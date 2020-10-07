# frozen_string_literal: true

describe ProcessPayment do
  subject(:call) { described_class.new.call }

  describe '.call' do
    context 'when it successed' do
      let(:expected_json) do
        {
          'currency' => 'USD',
          'amount' => '100',
          'description' => '179324',
          'status' => 'new',
          'id' => '5f7c9f579296e1720',
          'resolve_underpaid' => false,
          'resolve_overpaid' => false,
          'hosted_url' => 'https://acquiring-sandbox.mercuryo.io/invoices/5f7c9f579296e1720',
          'pricing' =>
          {
            'BTC' =>
            {
              'currency' => 'BTC',
              'amount' => '0.01573192',
              'address' => '2NDMEP1SG5rBbnFaGfcvxcJej2fPCMwKQ7q',
              'qrcode' => 'iVBORw0KGgoAAAANSUhEUgAAAUAAAAFACAYAAADNk'
            }
          }
        }
      end

      before do
        allow_any_instance_of(http_client).to receive(:send_request).with
      end

      it { is_expected.to include(expected_json) }
    end
  end
end
