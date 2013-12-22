Sequel::Model.plugin :timestamps

Sequel.migration do
  change do
    create_table(:rabbits) do
      primary_key :id
      String :name, :null=>false
      String :description
      Integer :age
      String :color
      String :breed
    end
  end
end

