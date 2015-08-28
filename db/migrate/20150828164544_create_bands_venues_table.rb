class CreateBandsVenuesTable < ActiveRecord::Migration
  def change
    create_table(:bands_venues) do |bv|
      bv.column(:band_id, :integer)
      bv.column(:venue_id, :integer)

      bv.timestamps()
    end
  end
end
