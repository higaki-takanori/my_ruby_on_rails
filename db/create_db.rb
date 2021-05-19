require "sinatra/activerecord"

class MyRails < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database, {:adapter => "sqlite3", :database => "./db/db.sqlite3"}
end