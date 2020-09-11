# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| nickname        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| birth_date      | date   | null: false |

### Association

- has_many :items
- has_many :item_purchases

## items テーブル

| Column              | Type            | Options                        |
| ------              | ------          | -----------                    |
| user                | references      | null: false, foreign_key: true |
| name                | string          | null: false                    |
| description         | text            | null: false                    |
| category_id         | integer         | null: false                    |
| condition_id        | integer         | null: false                    |
| shipping_charges_id | integer         | null: false                    |
| area_id             | integer         | null: false                    |
| shipping_days_id    | integer         | null: false                    |
| price               | integer         | null: false                    |


### Association
- belongs_to_active_hash :genre
- has_one :item_purchase

## item_purchases テーブル

| Column          | Type             | Options                        |
| ------          | ----------       | ------------------------------ |
| user            | references       | null: false, foreign_key: true |
| item            | references       | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column            | Type             | Options                        |
| -------           | ----------       | ------------------------------ |
| post_code         | string           | null: false                    |
| item_purchase_id  | integer          | null: false, foreign_key: true |
| area_id           | integer          | null: false                    |
| city              | string           | null: false                    |
| address           | string           | null: false                    |
| building_name     | string           |                                |
| phone_number      | string           | null: false                    |

### Association

- belongs_to :item_purchase