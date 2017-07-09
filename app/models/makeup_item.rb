class MakeupItem < ApplicationRecord
	include PgSearch
	belongs_to :user
	enum makeup_type: {
		blush:                   'Blush',
		bronzer:                 'Bronzer',
		eyeshadow:               'Eyeshadow',
		highlighter: 			 'Highlighter',
		lipstick:  				 'Lipstick'
	}
	pg_search_scope :search_by_name, against: [:name],
	    using: {
	      tsearch: {
	        prefix: true
	      }
	    }
end
