class AddColumnPhoneNumber < ActiveRecord::Migration
  def change
  	add_column :articles, :phone_number, :integer
  end
end
