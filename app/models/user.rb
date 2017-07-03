class User < ApplicationRecord
	has_many :makeup_items, dependent: :destroy
end
