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

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| name           | string | null: false |
| employee_id    | string | null: false |
| password       | string | null: false |

## Association

- has_many :restaurants
- has_many :comments
- has_many :messages
- has_many :likes
- has_many :liked_restaurants

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

## Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :liked_users
- has_many :restaurant_tag_relations

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

## tagsテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| name           | string    | null: false, uniqueness: true  |

## Association

- has_many :restaurant_tag_relations

## restaurant_tag_relationsテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| tag            | reference | null: false, foreign_key: true |
| restaurant     | reference | null: false, foreign_key: true |

## Association

- belongs_to :tag
- belongs_to :restaurant

## likesテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| user           | reference | null: false, foreign_key: true |
| restaurant     | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :restaurant