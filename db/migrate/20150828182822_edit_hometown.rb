class EditHometown < ActiveRecord::Migration
  def change
    remove_column(:bands, :hometown, :string)

    add_column(:bands, :city, :string)
    add_column(:bands, :state, :string)
  end
end
