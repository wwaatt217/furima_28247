class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_address
end
