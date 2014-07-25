class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :restaurant
      t.string :email
      t.string :time
      t.text :message

      t.timestamps
    end
  end
end
