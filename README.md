# README

## users テーブル

| Column             | Type   | Opinions    |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name(kana)    | string | null: false |
| first_name(kana)   | string | null: false |
| birthday           | date   | null: false |

### Association

-has_many :items
-belongs_to :shoppings


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false,                   |
| explanation      | text       | null: false,                   |
| category_id      | integer    | null: false,                   |
| status_id        | integer    | null: false,                   |
| delivery_load_id | integer    | null: false,                   |
| delivery_area_id | integer    | null: false,                   |
| delivery_days_id | integer    | null: false,                   |
| price            | integer    | null: false,                   |
| user             | references | null: false, foreign_key :true |

### Association

belongs_to :users
has_one :information


## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null; false, foreign_key: true |
| item   | references | null: false, foreign_key: true | 

### Association

belongs_to :items
has_many :users
belongs_to :information


## deliveries テーブル

| Column           | Type       | Opinions                       |
| ---------------- | ---------- | ------------------------------ |
| postal_cord      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| record           | references | null: false, foreign_key: true |

### Association
belongs_to :records