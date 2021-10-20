# README

## users テーブル

| Column             | Type   | Opinions                  |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

-has_many :items
-has_many :records


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_load_id | integer    | null: false                    |
| delivery_area_id | integer    | null: false                    |
| delivery_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key :true |

### Association

belongs_to :user
has_one :record


## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null; false, foreign_key: true |
| item   | references | null: false, foreign_key: true | 

### Association

belongs_to :item
belongs_to :user
has_one :delivery


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
belongs_to :record