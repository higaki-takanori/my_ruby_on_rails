# my_ruby_on_rails
railsの基本的な動きを理解するための練習

## 1.簡易的なWebサーバー作成

csv, sockets通信を用いて、リクエストがあったユーザーのname, emailを記載したHTMLをapp.rbから返却する。
ユーザーはcsvに一致するものがあるかどうかで判断している。route.rb等は使用していない。

## 2.MVC型に変更

app.rbからルーティング機能(route.rb等)、コントローラー、ビュー機能(controller, model, view)を切り離す。

例)
リクエストが

`/users/new`

の場合、流れは以下となる。

- `app.rb`がリクエスト`/users/new`を受け取る。
- リクエストに対して、`route.rb`の`get '/users/new',     to: 'users#new'`に従い、`users_controller`の`new`メソッドが実行される。
- `new`メソッドの`render "new"`により、`app.rb`に`views/users/new.html`の内容が返却される。
- `app.rb`からリクエスト先に対して、HTMLを返却する。

### 補足

> `route.rb`の`get`メソッドは`route_helper.rb`に記載。

> `users_controller.rb`の`new`メソッドが呼び出している`render`は`controller_helper.rb`に記載。

> usersクラスは`model/users.rb`に記載。※usersクラスとusers_controllerクラスは別物。

> コントローラーを増やす際は、`controller_list.rb`に記載しないと動作しない。

## 3.Active Recordの使用

csvからmysqlに変更するために、「sinatra-activerecord」を使用するように変更。
