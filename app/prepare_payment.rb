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
    {}
  end

  def build_headers
    { content_type: :json }
  end

  def build_url
    config
  end

  def config
    APP_CONF.dig('services', 'mpay', 'url')
  end
end
