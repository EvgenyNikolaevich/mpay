# frozen_string_literal: true

FactoryBot.define do
  factory :payment, class: 'Domains::Payment::Entities::Payment' do
    # trait :stub do
    #   created_at { Time.now.utc }
    #   updated_at { Time.now.utc }
    # end

    # uid    { SecureRandom.uuid }
    # status { 'processing' }

    # association :account, factory: :account
    # association :charge, factory: :money

    # association :on_fail,    factory: :webhook, url: 'http://example.com/on_fail'
    # association :callback,   factory: :webhook, url: 'http://example.com/callback'
    # association :on_success, factory: :webhook, url: 'http://example.com/on_success'

    initialize_with do
      Payment.new
    end

    # to_create do |instance|
    #   Domains::Payment::Repositories::Payment.new.create(instance)
    # end
  end
end
