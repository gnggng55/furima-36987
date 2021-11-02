class CreateDeriveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deriveries do |t|
      t.string :postal_cord, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :telephone_number, null: false
      t.references :record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
