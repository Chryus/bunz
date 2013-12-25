require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:///rabbit.db"

class Rabbit < ActiveRecord::Base
	validates :name, :uniqueness => true, :presense => true
end