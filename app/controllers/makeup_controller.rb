class MakeupController < ApplicationController
	require 'figaro'
	before_action :authenticate_makeup_user!, except: [:index]
	before_action :setup_makeup_item, except: [:index]

	def index
		searchQuery = params[:term]
		if searchQuery && !searchQuery.empty?
			@makeupItems = search_makeup_items(params[:term])
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
		setup_makeup_item
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
		setup_makeup_item
		params = addMakeupItemParams
		params[:user_id] = current_makeup_user.id

		@makeupItem.update(params)

		puts "== makeup params: #{params.inspect}"

		puts "=== valid: #{@makeupItem.valid?}"
		puts "==== new? #{@makeupItem.new_record?}"

		redirect_to makeup_path if @makeupItem.valid?
	end

	private

	def search_makeup_items(term)
		items = []
		MakeupItem.all.each do |item|
			if item.name.include?(term)
				items << item
			end
		end

		items
	end

	def setup_makeup_item
		puts "=== making a new makeup item"
		@makeupItem = MakeupItem.new
	end

	def addMakeupItemParams
		params.require(:makeup_item).permit(:name, :description, :price, :average_rating,
			:filepicker_url, :makeup_type)
	end
	end