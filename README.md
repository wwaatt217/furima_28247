# テーブル設計

## users テーブル

| Column            | Type   | Options      |
| ---------------   | ------ | -----------  |
| name              | string | null: false  |
| email             | string | null: false  |
| password          | string | null: false  |
| family_name       | string | null: false  |
| family_name_kana  | string | null: false  |
| first_name        | string | null: false  |
| first_name_kana   | string | null: false  |
| birthdate         | date   | null: false  |

### Association

- has_many :items
- has_many :buy

## items テーブル

| Column            | Type        | Options                         |
| ----------------  | ----------- | ------------------------------  |
| name              | string      | null: false                     |
| text              | text        | null: false                     |
| price             | integer     | null: false                     |
| image             | string      | null:false                      |
| user_id           | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column      | Type       | Options                         |
| ----------  | ---------- | ------------------------------  |
| user_id     | references | null: false, foreign_key: true  |
| item_id     | refarences | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item


## addresses テーブル

| Column         | Type   | Options     |
| -------------  | ------ | ----------- |
| postal_cord    | string | null: false |
| prefecture     | string | null: false |
| city           | string | null: false |
| block          | string | null: false |
| buliding_name  | string | null: false |
| phone_number   | string | null: false |

### Association

- has_one :buy

