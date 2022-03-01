# アプリケーション名
TransPhoto

# アプリケーション概要
翻訳して欲しいフォトを投稿し、ユーザー同士でコンテンツを翻訳する。

# URL
Herokuによるデプロイ
https://transphoto.herokuapp.com/

・Basic認証ID：admin
・Basic認証パスワード：2222

# テスト用アカウント
翻訳者用
・メールアドレス：aaa@aaa.com
・パスワード：aaaaaa

投稿者用
・メールアドレス：bbb@bbb.com
・パスワード：bbbbbb

# 利用方法
## 目標投稿
1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2. 新規投稿ボタンから、タイトル・言語ペア・メッセージ・画像を入力投稿する
3. 翻訳した内容をコメントとして投稿する

# アプリケーションを作成した背景
個人的な経験から、日本語の読み方がわからないと、グーグル翻訳が使えない時があったことで、もし写真だけを撮って、翻訳していただくと助かると思う。

# 洗い出した要件

# 実装した機能についての画像やGIFおよびその説明
## トップページ
[![Image from Gyazo](https://i.gyazo.com/7bad9f7de5bbe5dcd20d7fc310ba59fd.gif)](https://gyazo.com/7bad9f7de5bbe5dcd20d7fc310ba59fd)
## 1.ユーザー登録機能
[![Image from Gyazo](https://i.gyazo.com/916b5b418f35bc83356c59033e703914.gif)](https://gyazo.com/916b5b418f35bc83356c59033e703914)
## 2.投稿機能
[![Image from Gyazo](https://i.gyazo.com/1d85797e0e2aa622f4bdd4e8f196d072.gif)](https://gyazo.com/1d85797e0e2aa622f4bdd4e8f196d072)
## 3.投稿編集機能
[![Image from Gyazo](https://i.gyazo.com/45f3e158e61897773ffaf05ee0c57ace.gif)](https://gyazo.com/45f3e158e61897773ffaf05ee0c57ace)
## 4.投稿削除機能
[![Image from Gyazo](https://i.gyazo.com/045174578a0f3fac6a3a44049d80e932.gif)](https://gyazo.com/045174578a0f3fac6a3a44049d80e932)
## 5.コメント機能
[![Image from Gyazo](https://i.gyazo.com/99877cb61f2501a6d0ddeba75358734f.gif)](https://gyazo.com/99877cb61f2501a6d0ddeba75358734f)

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/a1921d63cb4a6bbcfb14b5d7f2b69110.png)](https://gyazo.com/a1921d63cb4a6bbcfb14b5d7f2b69110)

# 開発環境
・フロントエンド
・バックエンド
・テスト

# ローカルでの動作方法
% git clone https://github.com/xiaoanise/transphoto.git
% cd transphoto
% bundle install
% rails db:create
% rails db:migrate
% yarn install

# 工夫したポイント


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
| text         | text       | null: false                    |
| transphoto   | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :prototype