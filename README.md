# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_kana          | string | null: false |
| first_kana         | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :records


## items テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| product_name       | string       | null: false |
| content            | text         | null: false |
| category_id        | integer      | null: false |
| condition_id       | integer      | null: false |
| postage_type_id    | integer      | null: false |
| prefectures_id     | integer      | null: false |
| preparation_day_id | integer      | null: false |
| price              | integer      | null: false |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :records
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :preparation_day

## records テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |

### Association

- belongs_to :users
- belongs_to :items
- has_one :address


## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefectures     | string     | null: false                    |
| municipalities  | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| records         | references | null: false, foreign_key: true |

### Association

- belongs_to :records