class CreateDesks < ActiveRecord::Migration[7.1]
  def change
    create_table :desks do |t|
      t.string :title
      t.text :description
      t.float :price_per_hour
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
