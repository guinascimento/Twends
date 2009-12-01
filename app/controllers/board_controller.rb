require 'Flickr'
require 'twitter'

class BoardController < ApplicationController

	def index
		minute = Twitter::Trends.current
		day = Twitter::Trends.daily
		week = Twitter::Trends.weekly

		total = 0
		trend_name = params[:trends]
		@photos = {}

		@messages = Array.new

		if trend_name == "minute"
			for t in minute do
				total += 1
				@photos[t.name] = Flickr.search(t.name)
				break if total == 10
			end
		end

		if trend_name == "day"
			for t in day do
				total += 1
				@photos[t.name] = Flickr.search(t.name)
				break if total == 10
			end
		end

		if trend_name == "week"
			for t in week do
				total += 1
				@photos[t.name] = Flickr.search(t.name)
				break if total == 10
			end
		end
	end
end