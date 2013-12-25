require 'Bundler'
Bundler.require
require_relative './lib/rabbit.rb'

class App < Sinatra::Application 

	#this is just explicit stuff so Sinatra knows this is the root http://ashleygwilliams.github.io/ratpack/
  configure do
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, "views") }
	end
end

  
