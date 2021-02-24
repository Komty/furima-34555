# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| -----------------  | ------ | ------------------------- | 
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family-name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_one  :card
- has_one  :buyer

## card テーブル

| Column      | Type       | Options                        |
| ----------- | -----------| -------------------------------|
| user_id     | integer    | null: false, foreign_key: true |
| customer_id | string     | null: false                    |

### Association

- belongs_to :user

## buyer テーブル

| Column       | Type       | Options                        |
| -------------| -----------| -------------------------------|
| user_id      | integer    | null: false, foreign_key: true |
| post_code    | string     | null: false                    |
| prefecture_id| integer    | null: false                    | 
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building_name| string     |                                | 
| phone_number | string     | null: false                    |

### Association

- belongs_to :user

## items テーブル

| Column           | Type       | Options                        |
| -----------------| -----------| -------------------------------|
| image            | string     | null: false                    |
| name             | string     | null: false                    |
| description      | text       | null: false                    | 
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery-cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_day_id  | integer    | null: false                    | 
| price            | integer    | null: false                    |
| user_id          | integer    | null: false, foreign_key:true  |

### Association

- belongs_to :user
