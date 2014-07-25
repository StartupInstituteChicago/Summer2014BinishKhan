class AddDateColumn < ActiveRecord::Migration
  def change
  	add_column :reservations, :requested_at, :datetime
  end
end
