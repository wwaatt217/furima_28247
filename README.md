# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ---------------   | ------ | ----------- |
| name              | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| family_name(kana) | string | null: false |
| first_name        | string | null: false |
| first_name(kana)  | string | null: false |
| birthdate         | string | null: false |

### Association

- has_many :items
- has_one :buy

## items テーブル

| Column            | Type   | Options     |
| ----------------  | ------ | ----------- |
| name              | string | null: false |
| text              | text   | null: false |
| price             | string | null: false |
| image             | string | null:false  |
| category          | string | null: false |
| product_state     | string | null: false |
| shipping_charges  | string | null: false |
| shipping_address  | string | null: false |
| delivery_days     | string | null: false |
| user_id           | string | null: false |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column      | Type   | Options     |
| ----------  | ------ | ----------- |
| user_id     | string | null: false |
| item_id     | string | null: false |
| address_id  | string | null: false |
| card_id     | string | null: false |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address
- belongs_to :card


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

## card テーブル

| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| number           | string | null: false |
| expiration_date  | string | null: false |
| security_code    | string | null: false |
| card_id          | string | null: false |

### Association

- has_one :buy