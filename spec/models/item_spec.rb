require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
    end

    it '全て存在していれば保存できること' do
      expect(@item).to be_valid
    end

    it '画像が無ければ保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が無ければ保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品説明が無ければ保存できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報が無ければ保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'カテゴリーの情報がデフォルトの場合だと保存できないこと' do
      @item.category_id = '--'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end

    it '商品の状態についての情報が無ければ保存できないこと' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '商品の状態についての情報がデフォルトの場合だと保存できないこと' do
      @item.condition_id = '--'
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition is not a number')
    end

    it '配送料負担についての記述が無ければ保存できないこと' do
      @item.shipping_charges_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
    end

    it '配送料負担についての情報がデフォルトの場合だと保存できないこと' do
      @item.shipping_charges_id = '--'
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping charges is not a number')
    end

    it '発送元の地域の情報が無ければ保存できないこと' do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it '発送元の地域についての情報がデフォルトの場合だと保存できないこと' do
      @item.area_id = '--'
      @item.valid?
      expect(@item.errors.full_messages).to include('Area is not a number')
    end

    it '発送までの日数についての情報が無ければ保存できないこと' do
      @item.shipping_days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end

    it '発送までの日数についての情報がデフォルトの場合だと保存できないこと' do
      @item.shipping_days_id = '--'
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping days is not a number')
    end

    it '価格についての情報が無ければ保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、￥300〜9999999の間でないと保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than 300')
    end

    it '価格の範囲が、￥300〜9999999の間でないと保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 9999999')
    end

    it '販売価格は半角数字のみで入力しなければ保存できないこと' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
