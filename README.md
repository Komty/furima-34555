# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family-name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday_day_yy  | string | null: false |
| birthday_day_mm  | string | null: false |
| birthday_day_dd  | string | null: false |

### Association

- has_many :items
- has_one  :card
- has_one  :buyer

## card テーブル

| Column      | Type       | Options                        |
| ----------- | -----------| -------------------------------|
| user_id     | integer    | null: false, foreign_key: true |
| customer_id | string     | null: false                    |
| card_id     | string     | null: false                    | 

### Association

- belongs_to :user

## buyer テーブル

| Column       | Type       | Options                        |
| -------------| -----------| -------------------------------|
| user_id      | integer    | null: false, foreign_key: true |
| post_code    | string     | null: false                    |
| prefecture   | string     | null: false                    | 
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building_name| string     |                                | 
| phone_number | string     |                                |

### Association

- belongs_to :user

## items テーブル

| Column       | Type       | Options                        |
| -------------| -----------| -------------------------------|
| image        | string     | null: false                    |
| name         | string     | null: false                    |
| description  | string     | null: false                    | 
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| delivery-cost| string     | null: false                    |
| prefecture   | string     | null: false                    |
| delivery_days| string     | null: false                    | 
| price        | string     | null: false                    |
| user_id      | integer    | null: false, foreign_key:true  |

### Association

- belongs_to :user
