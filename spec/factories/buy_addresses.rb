FactoryBot.define do
  factory :buy_address do
    postal_code       { '123-4567' }
    prefecture        { 2 }
    city              { '横浜市' }
    block             { '青山1-1-1' }
    building_name     { '柳ビル' }
    phone_number      { '09012345678' }
    # association :user
    # association :item
    # association :buy
    user_id { 1 }
    item_id { 1 }
    buy_id  { 1 }
  end
end
