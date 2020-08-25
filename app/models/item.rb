class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
 
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

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
    numericality: { only_integer: true, greater_than: 299, less_than: 10000000}
  end



end
