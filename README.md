<img width="1200" alt="Screen Shot 2020-12-10 at 20 21 46" src="https://user-images.githubusercontent.com/70573950/101766415-1ad69a80-3b26-11eb-82ff-1e88aca8da5e.png">

## アプリ概要
[O!SHI-ete](http://www.oshiete.link/)

【簡単ログイン】からテストユーザーとしてログインしていただけます。

「オイシイを教えあおう」をコンセプトにした宿泊施設従業員向けの飲食店情報共有サービスです。

## 作成の背景
前職でお客様からオススメのレストランを聞かれることが多かったのですが、果たしてベストな回答ができているのか疑問に思ったことが始まりでした。

もちろん自分が美味しいと思うレストランをオススメするのですが、自分の味覚とお客様の味覚が同じとは限りません。
甘党の人が辛党の人にオススメを紹介しても「美味しかったけど、ちょっと違う」ということがあるのではないかと思いました。
従来のグルメ用口コミサイトも便利ではあるのですが、どうしても「又聞き感」が出てしまいます。

そこで、社内で「お客様にオススメするという視点を持った口コミ」を共有できる場があればお客様によりリアルで満足度の高い提案ができるのではないかと考え制作に至りました。

## 機能一覧
- 飲食店情報投稿機能
- コメント機能（非同期通信）
- 検索機能
- いいね機能（非同期通信）
- ランキング機能
- チャット機能（非同期通信）
- マップ表示機能（GoogleMap API、Geocoding API）
- レスポンシブデザイン

<img width="204" alt="Screen Shot 2020-12-10 at 20 39 53" src="https://user-images.githubusercontent.com/70573950/101767724-f085dc80-3b27-11eb-8294-896ef520d218.png">  <img width="200" alt="Screen Shot 2020-12-10 at 20 40 06" src="https://user-images.githubusercontent.com/70573950/101767730-f24fa000-3b27-11eb-9bd7-14c05b39b995.png">

## 技術・環境
### フロントエンド
- HTML
- CSS
- JavaScript/ jQuery/ Ajax/ Action Cable

### バックエンド
- Ruby
- Ruby on Rails

### インフラ
- AWS （EC2、S3、Route53）
- Docker/ Docker-compose
- MySQL
- Nginx、 Puma
- Unicorn

### テスト
- Rspec
- FactoryBot
- Capybara

## テーブル設計

### usersテーブル

| Column         | Type    | Options        |
| -------------- | ------- | -------------- |
| name           | string  | null: false    |
| name_kana      | string  | null: false    |
| employee_id    | string  | null: false    |
| email          | string  | null: false    |
| password       | string  | null: false    |
| admin          | boolean | default: false |

### Association

- has_many :restaurants
- has_many :comments
- has_many :messages
- has_many :likes
- has_many :liked_restaurants, through: :likes

### restaurantsテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| name           | string    | null: false                    |
| description    | text      | null: false                    |
| genre_id       | integer   | null: false                    |
| ambiance_id    | integer   | null: false                    |
| price_id       | integer   | null: false                    |
| tel            | string    | null: false                    |
| address        | string    | null: false                    |
| opening_hour   | string    | null: false                    |
| closed         | string    | null: false                    |
| user           | reference | null: false, foreign_key: true |
| latitude       | float     | null: true                     |
| longitude      | float     | null: true                     |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :liked_users, through: :likes

### commentsテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| content        | text      | null: false                    |
| user           | reference | null: false, foreign_key: true |
| restaurant     | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :restaurant

### messagesテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| content        | text      | null: false                    |
| user           | reference | null: false, foreign_key: true |

### Association

- belongs_to :user


### likesテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| user           | reference | null: false, foreign_key: true |
| restaurant     | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :restaurant
