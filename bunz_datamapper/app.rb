require 'bundler'
Bundler.require
require_relative './lib/rabbit'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/rabbits.db")

class App < Sinatra::Application

	#list all rabbits
	get '/rabbits' do
		@rabbits = Rabbit.all
		haml :index
	end

	#add new rabbit
	get '/rabbits/new' do
		@rabbit = Rabbit.new
		haml :new
	end

	#create a new rabbit
	post '/rabbits' do
		@rabbit = Rabbit.new(params[:rabbit])
		if @rabbit.save
			status 201
			redirect '/rabbits/' + @rabbit.id.to_s
		else
			status 400
			haml :new
		end
	end

	#edit a rabbit
	get '/rabbits/edit/:id' do
		@rabbit = Rabbit.get(params[:id])
		haml :edit
	end

	#update rabbit handler/route
	put '/rabbits/:id' do
		@rabbit = Rabbit.get(params[:id])
		if @rabbit.update(params[:rabbit])
			status 201
			redirect '/rabbits/'+ (params[:id])
		else
			status 400
			haml :edit
		end
	end

	#delete rabbit confirmation handler
	get '/rabbits/delete/:id' do
		@rabbit = Rabbit.get(params[:id])
		haml :delete
	end

	#delete rabbit handler
	delete 'rabbits/:id' do
		Rabbit.get(params[:id]).destroy
		redirect '/rabbits'
	end

	#show rabbit #why does this matter so much? the order?
	get '/rabbits/:id' do
		@rabbit = Rabbit.get(params[:id])
		haml :show
	end

end


DataMapper.auto_upgrade!
