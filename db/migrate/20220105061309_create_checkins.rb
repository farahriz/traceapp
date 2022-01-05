class CreateCheckins < ActiveRecord::Migration[7.0]
  def change
    create_table :checkins do |t|
      t.string :first_name
      t.string :last_name
      t.decimal :temperature
      t.references :location, index:true, foreign_key: true

      t.timestamps null:false
    end
    add_index :checkins, [:location_id, :created_at]
  end
end
