# README

# テーブル設計

## users テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------        |
| nickname           | string     | null: false,                    |
| email              | string     | null: false, unique             |
| encrypted_password | string     | null: false,                    |
| family_name        | string     | null: false, format: Full-width |
| first_name         | string     | null: false, format: Full-width |
| family_name_kana   | string     | null: false, format: カタカナ     |
| first_name_kana    | string     | null: false, format: カタカナ     |
| birthday           | date       | null: false                     |

’
deviceのgemを使用
’

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| text     | text       | null: false                    |
| category | set        |                                |
| status   | set        |                                |
| charge   | set        |                                |
| sender   | set        |                                |
| shipping | set        |                                |
| price    | intger     | null: false, foreign_key: true |
| sold_out | Boolean    |                                |
| user     | references | null: false, foreign_key: true |
| buyer    | references | null: false, foreign_key: true |

### Set

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

| sender    |
| -------   |
| 47都道府県 |

| shipping   |
| ---------- |
| 1~2日で発送 |
| 2~3日で発送 |
| 4~7日で発送 |

### Association

- belongs_to :user
- belongs_to :purchase


## purchases テーブル
| Column       | Type       | Options                        |
| -----------  | ---------- | ------------------------------ |
| postal_code  | integer    |null: false                     |
| prefecture   | string     |null: false                     |
| city         | string     |null: false                     |
| address      | string     |null: false                     |
| building     | string     |                                |
| phone_number | integer    |null: false                     |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item