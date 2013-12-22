require 'bundler'
Bundler.require
require_relative './lib/rabbit'

#DB = Sequel.connect('sqlite://rabbits.db')

class App < Sinatra::Application

	#list all rabbits
	get '/rabbits' do
		@rabbits = Rabbit.all
		erb :index
	end

	#add new rabbit
	get '/rabbits/new' do
		@rabbit = Rabbit.new
		erb :new
	end

	#edit rabbit
	post '/rabbits' do
		@rabbit = Rabbit.new(params[:rabbit])
		if @rabbit.save
			status 201
			redirect '/rabbits' + @rabbit.id.to_s
		else
			status 400
			erb :new
		end
	end

	#update rabbit handler/route
	put '/rabbits/:id' do
		@rabbit = Rabbit.get(params[:id])
		if @rabbit.update(params[:rabbit])
			status 201
			redirect '/rabbits/' + params[:id]
		else
			status 400
			erb :edit
		end
	end

	#delete rabbit confirmation handler
	get '/rabbits/delete/:id' do
		@rabbit = Rabbit.get(params[:id])
		erb :delete
	end

	#delete rabbit handler
	delete 'rabbits/:id' do
		Rabbit.get(params[:id]).destroy
		redirect '/rabbits'
	end

	#show rabbit
	get '/rabbits/:id' do
		@rabbit = Rabbit.get(params[:id])
		erb :show
	end

end
