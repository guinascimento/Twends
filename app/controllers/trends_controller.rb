require 'Flickr'

class TrendsController < ApplicationController
	$total = 0

	def minute
		minute = Twitter::Trends.current
		@photos = {}

		for trend in minute do
			$total += 1
			@photos[trend.name] = Flickr.search(trend.name)
			break if $total == 10
		end

		render :template => "trends/index"
	end
	
	def day
		day = Twitter::Trends.daily
		@photos = {}

		for trend in day do
			$total += 1
			@photos[trend.name] = Flickr.search(trend.name)
			break if $total == 10
		end

		render :template => "trends/index"
	end
	
	def week
		week = Twitter::Trends.weekly
		@photos = {}

		for trend in week do
			$total += 1
			@photos[trend.name] = Flickr.search(trend.name)
			break if $total == 10
		end

		render :template => "trends/index"
	end
end