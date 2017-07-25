class SetMakeupItemDefaultsToNotNull < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :makeup_items, :name, false
  	change_column_null :makeup_items, :price, false
  	change_column_null :makeup_items, :average_rating, false
  end
end
