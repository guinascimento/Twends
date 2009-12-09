require 'flickr'

class TrendsController < ApplicationController
	layout "application"

	def minute
		minute = Twitter::Trends.current
		@photos = {}

		for trend in minute do
			@photos[trend.name] = Flickr.search(trend.name)
		end
		render :template => "trends/index"
	end

	def day
		day = Twitter::Trends.daily
		@photos = {}
		total = 0

		for trend in day do
			total += 1
			@photos[trend.name] = Flickr.search(trend.name)
			break if total == 10
		end

		render :template => "trends/index"
	end
	
	def week
		week = Twitter::Trends.weekly
		@photos = {}
		total = 0

		for trend in week do
			total += 1
			@photos[trend.name] = Flickr.search(trend.name)
			break if total == 10
		end

		render :template => "trends/index"
	end
	
	def tweets
		@tweets = Twitter::Search.new(params[:trend]).per_page(50)
		@photos = Flickr.search(params[:trend], 9)

		render :template => "trends/tweets"
	end

	def search
		redirect_to :action => "tweets", :trend => params[:trend]
	end
end