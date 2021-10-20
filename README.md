# README

## users テーブル

| Column             | Type   | Opinions    |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| name(kana )        | string | null: false |
| birthday           | string | null: false |

### Association

-has_many :items
-belongs_to :shoppings


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false,                   |
| explanation   | text       | null: false,                   |
| category      | text       | null: false,                   |
| status        | string     | null: false,                   |
| delivery_load | string     | null: false,                   |
| delivery_area | string     | null: false,                   |
| delivery_days | string     | null: false,                   |
| price         | integer    | null: false,                   |
| user_id       | references | null: false, foreign_key :true |

### Association

belongs_to :users
has_one :information


## records テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null; false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true | 

### Association

belongs_to :items
has_many :users
belongs_to :information


## information テーブル

| Column           | Type      | Opinions                       |
| ---------------- | --------- | ------------------------------ |
| postal_cord      | integer   | null: false                    |
| prefecture       | string    | null: false                    |
| city             | string    | null: false                    |
| address          | integer   | null: false                    |
| building         | string    |                                |
| telephone_number | string    | null: false                    |
| record_id        | reference | null: false, foreign_key: true |

### Association
belongs_to :records