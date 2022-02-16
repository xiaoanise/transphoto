# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| introduction       | text   | null: false |
| language           | text   | null: false |
| hobby              | text   | null: false |

### Association

- has_many :transphotos
- has_many :comments

## transphotos テーブル

| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| title        | string     | null: false |
| from_to      | text       | null: false |
| message      | text       | null: false |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

//*imagesはActiveStorageで実装するため含まない

## comments テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| translation  | text       | null: false                    |
| transphoto   | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :prototype