require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
 
    describe '商品出品' do
      # it "imageが空だと出品できない" do
      #   @item.image = ""
      #   binding.pry
      #   @item.valid?
      # end

      it "必須事項入力で出品ができる" do
        @item
        expect(@item).to be_valid
      end

      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "textが空だと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが299以下だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it "priceが10,000,000以上だと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it "category_idが空だと登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "product_state_idが空だと登録できない" do
        @item.product_state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product state must be other than 1")
      end

      it "shipping_charges_idが空だと登録できない" do
        @item.shipping_charges_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end

      it "shipping_address_idが空だと登録できない" do
        @item.shipping_address_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping address must be other than 1")
      end

      it "delivery_days_idが空だと登録できない" do
        @item.delivery_days_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
      end


    end

end
