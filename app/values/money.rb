# frozen_string_literal: true

require 'money'

module Values
  class Money < ::Money
    CURRENCY_LIST = %w[EUR USD].freeze

    class << self
      def wrap(object)
        case object
        when self then object
        when Hash then from_hash(object)
        else new object.fractional, object.currency
        end
      end

      def from_amount(amount, currency)
        exponent = Money::Currency.wrap(currency).exponent
        super(BigDecimal(amount.to_s).floor(exponent), currency)
      end

      # rubocop:disable Metrics/MethodLength
      def from_hash(hash)
        amount     = fetch('amount',     hash)
        fractional = fetch('fractional', hash)
        currency   = fetch('currency',   hash)

        if fractional
          new(fractional, currency)
        elsif amount
          check_string_format!(amount) if amount.is_a? String
          from_amount(amount.to_f, currency)
        else
          raise ArgumentError, 'Hash should contain amount or fractional'
        end
      end
      # rubocop:enable Metrics/MethodLength

      private

      NUMERIC_PATTERN = /\A[\d_ ]+\.?[\d_]*\z/.freeze
      private_constant :NUMERIC_PATTERN

      # check if string is Numeric
      def check_string_format!(input)
        raise ArgumentError, 'Input must be numeric' unless input =~ NUMERIC_PATTERN
      end

      def fetch(key, hash)
        hash[key.to_s] || hash[key.to_sym]
      end
    end

    # @example
    #   money.to_h              # => { currency:, amount:, fractional: }
    #   money.to_h(:amount)     # => { currency:, amount: }
    #   money.to_h(:fractional) # => { currency:, fractional: }
    def to_h(key = nil)
      output = {
        amount: amount.to_f,
        fractional: fractional.to_f,
        currency: currency.to_s
      }
      output.slice!(key, :currency) if key
      output
    end
  end
end
