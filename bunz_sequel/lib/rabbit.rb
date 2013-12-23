require 'sequel'

DB = Sequel.connect('sqlite://rabbits.db')

Sequel::Model.plugin :timestamps

class Rabbit < Sequel::Model

end


