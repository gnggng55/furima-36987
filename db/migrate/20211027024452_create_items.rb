class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :item_name, null: false
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :delivery_load_id, null: false
      t.integer :delivery_area_id, null: false
      t.integer :delivery_day_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true

    end
  end
end
