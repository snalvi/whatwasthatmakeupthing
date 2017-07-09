class MakeupController < ApplicationController
	require 'figaro'

	before_action :authenticate_makeup_user!, except: [:index]

	def index
		searchQuery = params[:term]
		if searchQuery && !searchQuery.empty?
			@makeupItems = MakeupItem.search_by_name(params[:term])
		elsif params[:sort_by]
			case params[:sort_by]
			when "alpha"
				@makeupItems = allMakeupItems.sort_by(&:name)
			when "price"
				@makeupItems = allMakeupItems.sort_by(&:price)
			when "rating"
				@makeupItems = MakeupItem.order(average_rating: :desc)
			end
		end

		if @makeupItems.nil?
			@makeupItems = allMakeupItems
		end
	end

	def addmakeupitem
		@makeupItem = MakeupItem.new
	end

	def allMakeupItems
		MakeupItem.all
	end

	def search
		if params[:term]
			@makeupItems = MakeupItem.search_by_name(params[:term])
		end
	end

	def create
		params = addMakeupItemParams
		@makeupItem = MakeupItem.new(params)
		@makeupItem.save!

		redirect_to makeup_path
	end

	private

	def addMakeupItemParams
		params.require(:makeup_item).permit(:name, :description, :price, :average_rating, :user_id, :filepicker_url, :makeup_type)
	end
end