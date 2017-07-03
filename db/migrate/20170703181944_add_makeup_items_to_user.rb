class AddMakeupItemsToUser < ActiveRecord::Migration[5.1]
  def change
  	add_reference :users, :makeup_items, index: true
  	add_reference :makeup_items, :user, index: true
  end
end
