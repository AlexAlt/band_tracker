class CreateVenues < ActiveRecord::Migration
  def change
    create_table(:venues) do |v|
      v.column(:name, :string)
      v.column(:city, :string)

      v.timestamps()
    end
  end
end
