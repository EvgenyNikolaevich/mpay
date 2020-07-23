# frozen_string_literal: true

require 'uri'

class Validator < Dry::Validation::Contract
  UUID_PATTERN = /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/.freeze
  IP_PATTERN   = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.freeze
  YEAR_RANGE   = (1910..Time.now.year - 18).freeze
  CURRENCY_LIST = %w[USD].freeze
  private_constant :UUID_PATTERN, :YEAR_RANGE, :IP_PATTERN

  params do
    required(:data).hash do
      required(:id).value(:string, format?: UUID_PATTERN)
      required(:type).value(:string, eql?: 'Payment')
      required(:attributes).hash do
        required(:account).hash do
          required(:uid).filled(:string, format?: UUID_PATTERN)
          required(:type).filled(:string)
        end
        required(:charge).hash do
          required(:fractional).filled(:int?, gt?: 0)
          required(:currency).filled(:string, included_in?: CURRENCY_LIST)
        end
        required(:webhooks).hash do
          required(:on_success).hash do
            required(:url).value(format?: URI::DEFAULT_PARSER.make_regexp)
          end

          required(:on_fail).hash do
            required(:url).value(format?: URI::DEFAULT_PARSER.make_regexp)
          end

          required(:callback).hash do
            required(:url).value(format?: URI::DEFAULT_PARSER.make_regexp)
          end
        end
      end
    end
  end
end
