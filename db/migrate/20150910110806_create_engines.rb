class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.string :title
      t.string :subtitle
      t.string :price
      t.string :stock_status
      t.string :coreamount
      t.string :availability
      t.string :product_code
      t.text :image_urls
      t.text :description
      t.integer :run_id

      t.timestamps null: false
    end
  end
end
