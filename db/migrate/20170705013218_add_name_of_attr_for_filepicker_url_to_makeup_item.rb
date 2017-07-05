class AddNameOfAttrForFilepickerUrlToMakeupItem < ActiveRecord::Migration[5.1]
  def change
  	add_column :makeup_items, :filepicker_url, :string
  end
end
