# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one :buy

## items テーブル

| Column   | Type   | Options     |
| ------   | ------ | ----------- |
| name     | string | null: false |
| text     | text   | null: false |
| image    | string | null:false  |
| user_id  | string | null: false |

### Association

- belongs_to user
- has_one :buy

## buys テーブル

| Column   | Type   | Options     |
| ------   | ------ | ----------- |
| item_id  | string | null: false |
| user_id  | string | null: false |

### Association

- belongs_to user
- belongs_to item

