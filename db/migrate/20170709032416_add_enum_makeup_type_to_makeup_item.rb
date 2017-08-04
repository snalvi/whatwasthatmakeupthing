class AddEnumMakeupTypeToMakeupItem < ActiveRecord::Migration[5.1]
  def change
    add_column :makeup_items, :makeup_type, :string
  end
end
