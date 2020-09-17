require 'rails_helper'

RSpec.describe ItemPurchaseAddress, type: :model do
  describe '#create' do
        before do
          @item_purchase_address = FactoryBot.build(:item_purchase_address)
        end

        it '全て存在していてば購入できること' do
          expect(@item_purchase_address).to be_valid
        end

        it 'カード情報が空だと購入できないこと' do
          @item_purchase_address.token = nil
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include("Token can't be blank")
         end

         

        it '郵便番号がからでは購入できないこと' do
          @item_purchase_address.post_code = nil
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include("Post code can't be blank")
        end

        it '郵便番号がハイフンを含み、7桁でないと購入できないこと' do
          @item_purchase_address.post_code = '12345678'
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include("Post code is sure to enter 7 digits including hyphens.")
        end

        it '都道府県の情報が空では登録できないこと' do
          @item_purchase_address.area_id = nil
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include("Area can't be blank")
        end


        it '都道府県の情報がデフォルトの場合だと保存できないこと' do
          @item_purchase_address.area_id = "--"
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include('Area is not a number')
        end


        it '市町村区の情報が空では購入できないこと' do
          @item_purchase_address.city = nil
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include("City can't be blank")
        end

        it '市町村区の情報が全角日本語でないと購入できないこと' do
          @item_purchase_address.city = 'hiratsuka'
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include("City is invalid. Input full-width characters.")
        end

        it '番地の情報が空では購入できないこと' do
          @item_purchase_address.address = nil
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include("Address can't be blank")
        end

        it '電話番号が空では購入できないこと' do
          @item_purchase_address.phone_number = nil
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号が10桁または11桁で、半角数字でないと購入できないこと' do
          @item_purchase_address.phone_number = 123456789012
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include("Phone number is sure to enter numerical values")
        end
end
end


