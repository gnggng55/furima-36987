class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :record, null: false, foreign_key: true
      t.references :derivery, null: false, foreign_key: true
      t.timestamps
    end
  end
end
