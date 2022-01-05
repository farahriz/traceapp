class AddIdenToCheckins < ActiveRecord::Migration[7.0]
  def change
    add_column :checkins, :identification, :string
  end
end
