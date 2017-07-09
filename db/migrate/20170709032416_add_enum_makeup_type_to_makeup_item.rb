class AddEnumMakeupTypeToMakeupItem < ActiveRecord::Migration[5.1]
  def change
    execute <<-SQL
      CREATE TYPE makeup_type AS ENUM ('Blush', 'Bronzer', 'Eyeshadow', 'Highlighter', 'Lipstick');
    SQL

    add_column :makeup_items, :makeup_type, :makeup_type, default: 'Blush'
  end
end
