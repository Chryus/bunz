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

	#create a new rabbit
	post '/rabbits' do
		@rabbit = Rabbit.new(params[:rabbit])
		if @rabbit.save
			status 201
			redirect '/rabbits/' + @rabbit.id.to_s
		else
			status 400
			haml: new
		end
	end

	#edit a rabbit
	get '/rabbits/edit/:id' do
		@rabbit = Rabbit.find(params[:id])
		haml :edit
	end




  
