class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :frist_name
      t.string :last_name

      t.timestamps
    end
  end
end
