require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '配送先住所の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_address = RecordAddress.new(post_code: '123-4567', prefecture_id: 2, municipalities: '横浜市', address: '青山', building_name:  '柳ビル', phone_number: '09012345678', token: "tok_abcdefghijk00000000000000000", user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @record_address.post_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.post_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @record_address. prefecture_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalities空だと保存できないこと' do
        @record_address.municipalities = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @record_address.address = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank", "Phone number 半角数字のみを使用してください")
      end
      it 'phone_numberが10桁以上11桁以内でないと保存できないこと' do
        @record_address.phone_number = '090123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number 半角数字のみを使用してください")
      end
      it 'phone_numberが半角でないと保存できないこと' do
        @record_address.phone_number = '０９０１２３４５６７８'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number 半角数字のみを使用してください")
      end
      it 'tokenが空だと保存できないこと' do
        @record_address.token = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @record_address.user_id = nil 
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @record_address.item_id = nil 
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
