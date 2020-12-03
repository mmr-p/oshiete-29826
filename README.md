# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| Column         | Type    | Options        |
| -------------- | ------- | -------------- |
| name           | string  | null: false    |
| name_kana      | string  | null: false    |
| employee_id    | string  | null: false    |
| email          | string  | null: false    |
| password       | string  | null: false    |
| admin          | boolean | default: false |

## Association

- has_many :restaurants
- has_many :comments
- has_many :messages
- has_many :likes
- has_many :liked_restaurants, through: :likes

## restaurantsテーブル

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

## Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :liked_users, through: :likes

## commentsテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| content        | text      | null: false                    |
| user           | reference | null: false, foreign_key: true |
| restaurant     | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :restaurant

## messagesテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| content        | text      | null: false                    |
| user           | reference | null: false, foreign_key: true |

## Association

- belongs_to :user


## likesテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| user           | reference | null: false, foreign_key: true |
| restaurant     | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :restaurant