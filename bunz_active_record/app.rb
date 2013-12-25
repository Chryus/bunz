require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:///rabbit.db"

class Rabbit < ActiveRecord::Base
	validates :name, :uniqueness => true, :presense => true

	#this is just explicit stuff so Sinatra knows this is the root http://ashleygwilliams.github.io/ratpack/
  configure do
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, "views") }
  end
  
end