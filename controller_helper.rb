Dir[File.expand_path('../app/models', __FILE__) << '/*.rb'].each do |file|
  require file
end

def error_view
  data = <<-ERROR
HTTP/1.1 404
Content-Type: text/html; Charset=UTF-8

<h1>404 Not Found</h1>
<div>お探しのページは見つかりませんでした。</div>
<div>#{$path} was not found on this server</div>
ERROR
end

def render(view, my_users=nil, user_index=nil)
  my_hash = Hash.new
  my_hash = {my_users: templete_users(my_users)}

  render_caller = caller[0].split("/")[-1].split("_")[0] # 呼び出し元 users_controllerの場合 users

  html_path = "./app/views/" + render_caller + "/" + view + ".html"
  data = <<-HTTP
HTTP/1.1 200 OK
Content-Type: text/html; Charset=UTF-8

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.2/css/bulma.min.css">
  </head>
HTTP

  File.open(html_path, "r") do |f|
    #data += f.read % {my_users: templete_users(my_users, user_index)}
    data += f.read % my_hash
  end
  
  data += <<-FOOTER
  <nav class="level is-mobile">
    <p class="level-item has-text-centered"><a href="/" class="link is-info">Home</a></p>
    <p class="level-item has-text-centered"><a href="/users" class="link is-info">ユーザー一覧</a></p>
    <p class="level-item has-text-centered"><a href="/users/new" class="link is-info">ユーザー登録</a></p>
  </nav>
</html>
FOOTER

  data
end

def templete_users(my_users)
  data = ""
  return data if my_users == nil
  if my_users.instance_of?(User)
    data += "<tr><td>#{my_users.name}</td><td>#{my_users.email}</td><td>#{my_users.hobby}</td><tr>"
  else
    my_users.each do |my_user|
      data += "<tr><td><a href='/users/#{my_user.id}'>#{my_user.name}</a></td><td>#{my_user.email}</td><td>#{my_user.hobby}</td><tr>"
    end
  end
  return data
end