# frozen_string_literal: true

FactoryBot.define do
  factory :money, class: 'Values::Money' do
    amount     { 100 }
    fractional { 10_000 }
    currency   { :usd }

    initialize_with do
      Values::Money.wrap(
        fractional: fractional,
        amount: amount,
        currency: currency
      )
    end

    to_create do |instance|
      Values::Money.wrap(
        fractional: instance.fractional,
        amount: instance.amount,
        currenct: instance.currency
      )
    end
  end
end
