class CreateSuggests < ActiveRecord::Migration[5.2]
  def change
    create_table :suggests do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :detail
      t.string :price, null: false
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime, null: false
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :suggests, :start_datetime
    add_index :suggests, :end_datetime
  end
end
