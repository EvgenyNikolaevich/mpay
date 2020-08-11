# frozen_string_literal: true

class PreparePayment
  def call(input)
    body    = build_body(input)
    headers = build_headers
    url     = build_url

    { url: url, body: body, headers: headers }
  end

  private

  def build_body(input)
    {
      currency: input[:currency],
      amount: input[:fractional] / 100,
      name: 'Amarkets payment',
      description: input[:uid]
    }
  end

  def build_headers
    { content_type: :json }
  end

  def build_url
    [config, 'v1.0/invoices'].join('/')
  end

  def config
    APP_CONF.dig('services', 'mpay', 'url')
  end
end
