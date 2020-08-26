FactoryBot.define do
  factory :item do
    name                        { 'aaaaaaaa' }
    text                        { 'aaaaaaaaa' }
    price                       { 10_000 }
    category_id                 { '2' }
    product_state_id            { '2' }
    shipping_charges_id         { '2' }
    shipping_address_id         { '2' }
    delivery_days_id            { '2' }
    association :user
  end
end
