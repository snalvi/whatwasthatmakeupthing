class CreateMakeupItems < ActiveRecord::Migration[5.1]
  def change
    create_table :makeup_items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.decimal :average_rating

      t.timestamps
    end
  end
end
