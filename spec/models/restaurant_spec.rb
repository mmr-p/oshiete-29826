require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe '店舗情報投稿機能' do
    before do
      @restaurant = FactoryBot.build(:restaurant)
      @restaurant.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全ての情報が正しく入力されていれば投稿できる' do
      expect(@restaurant).to be_valid
    end

    it '写真がなければ投稿できない' do
      @restaurant.image = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('写真を入力してください')
    end

    it '店名が入力されていなければ投稿できない' do
      @restaurant.name = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('お店の名前を入力してください')
    end

    it 'カテゴリーが選択されていなければ投稿できない' do
      @restaurant.genre_id = 1
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('カテゴリーを選択してください')
    end

    it 'カテゴリーがnilだと投稿できない' do
      @restaurant.genre_id = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('カテゴリーを選択してください')
    end

    it '雰囲気が選択されていなければ投稿できない' do
      @restaurant.ambiance_id = 1
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('お店の雰囲気を選択してください')
    end

    it '雰囲気がnilだと投稿できない' do
      @restaurant.ambiance_id = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('お店の雰囲気を選択してください')
    end

    it '価格帯が選択されていなければ投稿できない' do
      @restaurant.price_id = 1
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('価格帯を選択してください')
    end

    it '価格帯がnilだと投稿できない' do
      @restaurant.price_id = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('価格帯を選択してください')
    end

    it 'キャプションが入力されていなければ投稿できない' do
      @restaurant.description = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('キャプションを入力してください')
    end

    it '電話番号が入力されていなければ投稿できない' do
      @restaurant.tel = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('電話番号を入力してください')
    end

    it '電話番号にハイフンが含まれていると投稿できない' do
      @restaurant.tel = '086-123-1234'
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('電話番号の入力が正しくありません')
    end

    it '電話番号は半角入力でなければ投稿できない' do
      @restaurant.tel = '０８６１２３１２３４'
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('電話番号の入力が正しくありません')
    end
    
    it '住所が入力されていなければ投稿できない' do
      @restaurant.address = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('住所を入力してください')
    end

    it '営業時間が入力されていなければ投稿できない' do
      @restaurant.opening_hour = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('営業時間を入力してください')
    end

    it '定休日が入力されていなければ投稿できない' do
      @restaurant.closed = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('定休日を入力してください')
    end
  end
end
