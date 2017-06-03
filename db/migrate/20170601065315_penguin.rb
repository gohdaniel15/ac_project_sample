class Penguin < ActiveRecord::Migration[5.1]
  def change
    create_table :penguins do |t|
      t.integer :head, null: false
      t.integer :hand, null: false
      t.integer :foot, null: false
    end
  end
end
