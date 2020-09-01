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

## items テーブル

| Column              | Type            | Options                        |
| ------              | ------          | -----------                    |
| user                | references      | null: false, foreign_key: true |
| images              | integer         | null: false                    |
| description         | text            | null: false                    |
| category            | integer         | null: false                    |
| condition           | integer         | null: false                    |
| shipping_charges    | integer         | null: false                    |
| area                | integer         | null: false                    |
| shipping_days       | integer         | null: false                    |
| price               | integer         | null: false                    |


### Association

- has_one :item_purchase

## item_purchases テーブル

| Column          | Type             | Options                        |
| ------          | ----------       | ------------------------------ |
| user            | references       | null: false, foreign_key: true |
| item            | references       | null: false, foreign_key: true |
| address         | references       | null: false, foreign_key: true |


### Association

- belongs_to :item
- has_one :address

## addresses テーブル

| Column            | Type             | Options                        |
| -------           | ----------       | ------------------------------ |
| post_code         | string           | null: false                    |
| item_purchases_id | integer          | null: false, foreign_key: true |
| city              | string           | null: false                    |
| building_name     | string           | null: false                    |
| phone_number      | string           | null: false                    |

### Association

-belongs_to :buy