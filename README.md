# my_ruby_on_rails
railsの基本的な動きを理解するための練習

## 1.簡易的なWebサーバー作成

csv, sockets通信を用いて、リクエストがあったユーザーのname, emailを記載したHTMLをapp.rbから返却する。
ユーザーはcsvに一致するものがあるかどうかで判断している。route.rb等は使用していない。

## 2.MVC型に変更

app.rbからルーティング機能(route.rb等)、コントローラー、ビュー機能(controller, view)を切り離す。

例)
リクエストが

`/users/new`

の場合、流れは以下となる。

- app.rbがリクエスト`/users/new`を受け取る。
- リクエストに対して、route.rbの記載`get '/users/new',     to: 'users#new'`に従い、`users_controller`の`new`メソッドが実行される。
- 

## 3.Active Recordの使用

csvからmysqlに変更するために、「sinatra-activerecord」を使用するように変更。
