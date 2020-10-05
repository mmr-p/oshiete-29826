require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザ登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての情報が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end

    it '姓名が空では登録できない' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('姓名を入力してください')
    end

    it 'フリガナが空では登録できない' do
      @user.name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナを入力してください')
    end

    it '従業員IDが空では登録できない' do
      @user.employee_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('従業員IDを入力してください')
    end

    it 'Eメールが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end

    it 'パスワードが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'パスワードがあっても確認用パスワードが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
    end

    it '姓名が半角で入力されていると登録できない' do
      @user.name = 'yamadatarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓名の入力が正しくありません')
    end

    it 'フリガナは全角カタカナでなければ登録できない' do
      @user.name_kana = 'ﾔﾏﾀﾞﾀﾛｳ'
      @user.name = 'yamadataro'
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナは全角カタカナで入力してください')
    end

    it '従業員IDは全角では登録できない' do
      @user.employee_id = '１１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include('従業員IDは半角で入力してください')
    end

    it 'メールアドレスに＠が含まれていなければ登録できない' do
      @user.email = 'samplecom'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'メールアドレスが重複していては登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'パスワードが6文字未満だと登録できない' do
      @user.password = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'パスワードは半角英数字混合でなければ登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは英数字混合で入力してください')
    end
  end
end
