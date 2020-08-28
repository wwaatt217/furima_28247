class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_state
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_address
  belongs_to_active_hash :delivery_days

  validates :category_id, :product_state_id, :shipping_charges_id, :shipping_address_id, :delivery_days_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :product_state_id
    validates :shipping_charges_id
    validates :shipping_address_id
    validates :delivery_days_id
    validates :price,
              numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  end
end
