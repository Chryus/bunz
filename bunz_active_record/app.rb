require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:///rabbit.db"

class Rabbit < ActiveRecord::Base
end