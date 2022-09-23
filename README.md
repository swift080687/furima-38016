# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| name               | string | null: false |
| furigana           | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :
- has_many :


## items テーブル

| Column            | Type         | Options     |
| ----------------- | ------------ | ----------- |
| title             | string       | null: false |
| condition         | string       | null: false |
| shipping_charges  | string       | null: false |
| sender            | string       | null: false |
| shipment_day      | string       | null: false |
| user              | references   | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :records


## records テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |

### Association

- has_many :items
- has_one :shipping_info


## shipping_info テーブル

| Column         | Type       | Options                        |
| -----------    | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| adress         | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |

### Association

- has_one :shipping_info