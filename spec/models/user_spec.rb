require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_kanaとfirst_kana、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字混合で含まれないと登録できない' do
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '名字が空では登録ができない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '名前が空では登録ができない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '名字が半角では登録ができない' do
    end

    it '名前が半角では登録ができない' do
    end

    it '名字のカナが空では登録ができない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end

    it '名前のカナが空では登録ができない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
    end

    it '名字のカナが半角では登録ができない' do
    end

    it '名前のカナが半角では登録ができない' do
    end

    it '誕生日が空では登録ができない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
