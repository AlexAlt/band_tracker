class EditBands < ActiveRecord::Migration
  def change
    remove_column(:bands, :location, :string)

    add_column(:bands, :hometown, :string)
  end
end
