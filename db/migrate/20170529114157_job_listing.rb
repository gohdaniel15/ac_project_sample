class JobListing < ActiveRecord::Migration[5.1]
  def change
    create_table :job_listings do |t|
      t.references :user, index: true, foreign_key: true
      t.string :position, null: false
      t.integer :salary, null: false
      t.string :description, null: false
    end
  end
end
