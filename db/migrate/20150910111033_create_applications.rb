class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :make
      t.string :model
      t.string :year
      t.string :cyl
      t.string :size
      t.string :drv
      t.string :vin
      t.string :options
      t.integer :engine_id

      t.timestamps null: false
    end
  end
end
