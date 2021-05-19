require "socket"
require "pry"
require "./routes.rb"
require "sinatra/activerecord"

def read_post_data(session)
  headers = {}
  while line = session.gets.split(' ', 2)
    break if line[0] == ""
    headers[line[0].chop] = line[1].strip
  end
  string_form_data = session.read(headers["Content-Length"].to_i)
  form_data = {}

  string_form_data.split("&").each do |data|
    key, value = data.split("=") 
    form_data[key] = URI.unescape(value) # URI.unescape(value) ex)test%40gmail.com -> test@gmail.com 
  end

  name = form_data["name"]
  email = form_data["email"]
  hobby = form_data["hobby"]
  
  return name, email, hobby
end

server = TCPServer.open(2000)
puts "http://localhost:2000"

loop do
  session = server.accept

  # HTTP request
  header = session.gets
  method, $path = header.split

  if method == "GET" && $path == "/favicon.ico"
    next
  end

  # ex) /users/2 -> /users/:id
  route_path = $path.gsub(/[\d]+/, ":id")

  puts "request:" + method + " " + $path
  action = $routes[[method, route_path]]
  
  $input = read_post_data(session)

  begin
    view = action.call() 
  rescue => exception
    view = error_view() # 404 ERROR
  end
  
  # cliantに送信
  session.write(view)

  session.close
end

server.close