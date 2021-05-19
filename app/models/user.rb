require "active_record"
#ActiveRecord::Base.establish_connection("sqlite3://./db/db.sqlite3")
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "./db/db.sqlite3"
)
class User < ActiveRecord::Base
end