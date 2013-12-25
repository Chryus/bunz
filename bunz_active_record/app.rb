require 'Bundler'
Bundler.require
require_relative './lib/rabbit.rb'

class App < Sinatra::Application 

	#this is just explicit stuff so Sinatra knows this is the root http://ashleygwilliams.github.io/ratpack/
  configure do
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, "views") }
	end

	#list all rabbits
	get 'rabbits' do
		@rabbits = Rabbit.all?
		haml :index
	end

	#add new rabbit
	get '/rabbits/new' do
		@rabbit = Rabbit.new
		haml: new
	end

  
