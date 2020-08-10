# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items

## items テーブル

| Column   | Type   | Options     |
| ------   | ------ | ----------- |
| name     | string | null: false |
| text     | text   | null: false |
| image    | string | null:false  |
| user_id  | string | null: false |

### Association

- belongs_to user

