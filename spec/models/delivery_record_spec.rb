require 'rails_helper'

RSpec.describe DeliveryRecord, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/hero.jpg")
    @item.save
    @delivery_record = FactoryBot.build(:delivery_record, user_id: @user.id, item_id: @item.id)
    sleep(1)
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
      it '電話番号が9桁以下では購入できない' do
        @delivery_record.telephone_number = '09012345'
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が12桁以上では購入できない' do
        @delivery_record.telephone_number = '090123456789'
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @delivery_record.telephone_number = '0901234abcd'
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include('Telephone number is invalid')
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
      it 'userが紐づいていいないと保存できない' do
        @delivery_record.user_id = nil
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できない' do
        @delivery_record.item_id = nil
        @delivery_record.valid?
        expect(@delivery_record.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end


