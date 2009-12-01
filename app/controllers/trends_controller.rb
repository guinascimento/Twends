require 'Flickr'

class TrendsController < ApplicationController
	layout "application"

	def minute
		minute = Twitter::Trends.current
		@photos = {}
		total = 0

		for trend in minute do
			total += 1
			@photos[trend.name] = Flickr.search(trend.name, 1)
			break if total == 10
		end

		render :template => "trends/index"
	end
	
	def day
		day = Twitter::Trends.daily
		@photos = {}
		total = 0

		for trend in day do
			total += 1
			@photos[trend.name] = Flickr.search(trend.name, 1)
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
			@photos[trend.name] = Flickr.search(trend.name, 1)
			break if total == 10
		end

		render :template => "trends/index"
	end
	
	def trend_tweets
		@tweets = Twitter::Search.new(params[:trend])
		@photos = []
		
		
			@photos << Flickr.search(params[:trend], 5)
		

		puts @photos.inspect

		render :template => "trends/tweets"
	end
end