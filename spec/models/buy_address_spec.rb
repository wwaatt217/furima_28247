require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address)
  end

  describe '商品購入' do

    it 'user_idが空だと購入できない' do
      @buy_address.user_id = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと購入できない' do
      @buy_address.item_id = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Item can't be blank")
    end
    it 'postal_codeが空だと購入できない' do
      @buy_address.postal_code = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと購入できない' do
      @buy_address.postal_code = '1234567'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'postal_codeは３桁ハイフン４桁でないと購入できない' do
      @buy_address.postal_code = '123-456'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefectureが空だと購入できない' do
      @buy_address.prefecture = '1'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと購入できない' do
      @buy_address.city = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと購入できない' do
      @buy_address.block = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Block can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @buy_address.phone_number = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
    end
    it 'phone_numberが11桁以上だと購入できない' do
      @buy_address.phone_number = '123456789012'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
