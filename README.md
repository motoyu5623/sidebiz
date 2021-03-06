# Sidebiz
 
Sidebizは、「副業」 × 「スキル」がテーマのレビューサイトです。


* 副業の実際の業務内容や稼働時間、収入等を知ることができる
* 自分のどんなスキルがどの副業に活かせるか知ることができる
 
# イメージ

![sidebizz herokuapp com_side_jobs_2 (1)](https://user-images.githubusercontent.com/62973760/89298703-a172fb00-d6a0-11ea-9bbe-006188b55cfd.png) 

![sidebizz herokuapp com_side_jobs_2](https://user-images.githubusercontent.com/62973760/89298800-c7000480-d6a0-11ea-807c-2be969bba36d.png)

# 制作背景

* 自分のスキルがどんな職業で活かせるのかを知りたかった
* 副業人口が今後拡大していく中で、副業情報のニーズが現在進行形で高まっていると思った

# URL

[https://sidebizz.herokuapp.com/](https://sidebizz.herokuapp.com/)

# 使用技術

* フロントエンド
  * HTML
  * CSS
  * jQuery
  * Bootstrap 4.5
* バックエンド
  * Ruby 2.7
  * Ruby on Rails 6.0
* データベース
  * postgresql
* インフラ、開発環境等
  * heroku
  * Docker/docker-compose
  * CircleCI


# 機能一覧

* ユーザー関連
  * ユーザー登録、編集、削除
  * ログイン、ログアウト(ゲストログイン機能あり)
  * マイページ表示（自身の投稿、ストック済み投稿など表示）
  * プロフィール画像アップロード
* 副業レビュー関連
  * 新規投稿
    * 副業の基本情報
    * 重要なスキルセット
    * 本業との紐付けおよび比較
  * 一覧表示
    * 全投稿表示(ページネーションあり)
    * ユーザーごと
    * 検索（副業名、ユーザー名、スキル名、本業名から検索）
  * 詳細表示
    * スキルのレーダーチャート描画(副業と本業における重要度)
  * 編集、削除（本人のみ）
  * レビューへのコメント
  * レビューのストック
 
 
# 製作者
 
* yusuke sakamoto
 