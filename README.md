# リンク先
https://vote-app-api.herokuapp.com/

※開いても何も表示されません

# このアプリは何？
VoteAppという投票アプリ(**バックエンド**)です。
Yes/Noの2択でシンプルに賛否を問います。
投票機能というとTwitterのアンケートを連想しがちですが、異なる点は賛成派、反対派に別れてそれぞれ意見を投稿できる点です。

フロントエンドのソースコードはこちら  
https://github.com/higakijin/Vote-App

# 使用技術
- フロントエンド
  - NPM 8.1.0
  - Nuxt.js 2.15.8
- バックエンド
  - Ruby 2.7.4
  - Ruby on Rails 6.1.4.1（APIモード）
- CSSフレームワーク
  - Tailwind CSS 4.2.1
- デプロイ先：Heroku
  - バックエンド：https://vote-app-api.herokuapp.com/
  - フロントエンド：https://higakijin-vote-app.herokuapp.com/

# ER図
![](https://i.gyazo.com/63d21b8b31c82fd8d9fcab5795670573.png)

# 各コントローラーの役割

|  コントローラー名  |  役割  |
| ---- | ---- |
|  users  |  ユーザーについて。<br/>show:ユーザー詳細情報、<br />update：ユーザーデータの更新  |
| posts |  投稿について。<br />index：投稿の全て、<br />show：投稿の詳細情報、<br />create：投稿を作成、<br/>unpublished：下書きの投稿を取得、<br/>destroy：投稿を削除|
|  comments  |投稿に書くコメント。<br />create：コメントを作成|
|votes|投票の処理。<br/>create：投票の実施と**取り消し**<br/>|
|post_likes|投票につけるいいね（ハート）。<br />create：ハートをつける、<br/>destroy：ハートを取り消し
|comment_likes|コメントにつけるいいね（グッドボタン）。<br/>create：グッドをつける、<br/>destroy：グッドの取り消し|


