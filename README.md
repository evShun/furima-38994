# README

# テーブル設計

## users テーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | ------------------------   |
| nickname           | string     | null: false                |
| email              | string     | null: false, unique :true  |
| encrypted_password | string     | null: false                |
| family_name        | string     | null: false                |
| first_name         | string     | null: false                |
| family_name_kana   | string     | null: false                |
| first_name_kana    | string     | null: false                |
| birthday           | date       | null: false                |

’
deviceのgemを使用
’

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| text          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| charge_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| shipping_id   | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| purchase      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :purchase


## addresses テーブル
| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| number        | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase


## purchases テーブル
| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one    :item
- has_one    :address


### Active Hash

| category          |
| ----------------- |
| メンズ              |
| レディース           |
| ベビー・キッズ        |
| インテリア・住まい・小物|
| 本・音楽・ゲーム       |
| おもちゃ・ホビー・グッズ|
| 家電・スマホ・カメラ   |
| スポーツ・レジャー     |
| ハンドメイド          |
| その他               |

| status            |
| ----------------- |
| 新品・未使用         |
| 未使用に近い        |
| 目立った傷や汚れなし |
| やや傷や汚れあり     |
| 傷や汚れあり        |
| 全体的に状態が悪い   |

| charge            |
| ----------------- |
| 着払い(購入者負担)    |
| 送料込み(出品者負担)  |

| prefecture    |
| -------   |
| 47都道府県 |

| shipping   |
| ---------- |
| 1~2日で発送 |
| 2~3日で発送 |
| 4~7日で発送 |