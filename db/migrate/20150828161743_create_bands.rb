class CreateBands < ActiveRecord::Migration
  def change
    create_table(:bands) do |b|
      b.column(:name, :string)
      b.column(:location, :string)

      b.timestamps()
    end
  end
end
