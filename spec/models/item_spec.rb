require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/hero.jpg")
  end

  describe '商品出品' do
    context '商品出品できるとき'
      it '全ての項目が埋まっていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do
      it '商品名が空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it '商品の説明が空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end

      it 'カテゴリーが空だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it '商品の状態が空だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end

      it '配送料の負担が空だと登録できない' do
        @item.delivery_load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery load must be other than 1"
      end

      it '発送元の地域が空だと登録できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area must be other than 1"
      end

      it '発送までの日数が空だと登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day must be other than 1"
      end

      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が300〜9999999でないと保存できない' do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
    end
    
  end
