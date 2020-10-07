# frozen_string_literal: true

# process payment in payment system
class ProcessPayment
  def call
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
end
