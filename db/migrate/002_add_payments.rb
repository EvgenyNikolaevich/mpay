# Создаем таблицу, где будет храниться информация по платежам пользователей

Sequel.migration do
  change do
    create_table :payments do |_t|
      column   :uid,          :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      column   :account_uid,  :uuid, index: true

      String   :account_type, null: false
      String   :currency,     null: false
      Bignum   :fractional,   null: false
      String   :success_url,  null: false
      String   :fail_url,     null: false
      String   :callback_url, null: false
      String   :status,       null: false, default: 'processing'
      DateTime :created_at,   null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at,   null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
