class RemoveTimeColumn < ActiveRecord::Migration
  def change
  	remove_column :reservations, :time
  end
end
