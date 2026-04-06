# Learning_APP
## サイト概要
ITパスポート試験の学習を支援する問題集アプリです。
RailsのMVCやRESTful設計を実践的に理解することを目的として開発しました。
ユーザー認証を行い、ログインユーザーごとに問題回答履歴を管理できる仕組みを実装予定です。
CRUD機能を中心に、Webアプリケーション開発の基本を体系的に学習することを目的としております。

### 開発背景
Railsの基礎理解を深めるため、実務でよく使われる以下の要素を含むアプリケーションを開発しました。
- ユーザー認証
- モデル間の関連付け
- RESTful設計
- テストコードの実装
また、ITパスポート試験の学習と並行してIT基礎知識を身に付ける目的もあります。
​
### 認証・認可
- Deviseによる認証機能
- before_actionでログイン制御
- request specで他のユーザーとのデータの操作を禁止するテストを実装  
「ログインしていればOK」ではなくて
「自分のデータのみ操作可能」であることを担保しています。
​
### 主な機能
- 問題の作成・編集・削除(CRUD)
- 問題一覧・詳細表示
- 回答機能(正誤判定・解説表示)

## 使用技術
- Ruby 3.x
- Ruby on Rails 7.x
- PostgreSQL
- HTML / CSS
- JavaScript（jQuery）

## ER図
![ER Diagram](docs/learningアプリ_ER図.drawio.svg.svg)
​
## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
​