require 'rails_helper'

RSpec.describe DeliveryRecord, type: :model do
  before do
    @delivery_record = FactoryBot.build(:delivery_record)
  end

  describe '購入記録と住所の保存' do
    context '購入記録と住所が保存できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@delivery_record).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @delivery_record.building = ''
        expect(@delivery_record).to be_valid
      end
    end

    context '購入記録と住所が保存できないとき' do
      it 'postal_codeが空では保存できない' do
        @delivery_record.postal_code = ''
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれていなければ保存できない' do
        @delivery_record.postal_code = '1234567'
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空では保存できない' do
        @delivery_record.prefecture_id = ''
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @delivery_record.city = ''
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @delivery_record.address = ''
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空では保存できない' do
        @delivery_record.telephone_number = ''
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'prefecture_idが0では保存できない' do
        @delivery_record.prefecture_id = 0
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'tokenが空では保存できない' do
        @delivery_record.token = nil
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では保存できない' do
        @delivery_record.user_id = ''
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できない' do
        @delivery_record.item_id = ''
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end


