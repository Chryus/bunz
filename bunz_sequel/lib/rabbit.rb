DB = Sequel.connect('sqlite://rabbits.db')

Sequel::Model.plugin :timestamps

class Rabbit < Sequel::Model

	Rabbit.plugin :timestamps, :create=>:created_on, :update=>:updated_on

end


