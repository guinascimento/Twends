require 'Flickr'

class BoardController < ApplicationController

	def index
		minute = Twitter::Trends.current
		day = Twitter::Trends.daily
		week = Twitter::Trends.weekly

		trend_name = params[:trends]
		@photos = {}

		@messages = Array.new

		if trend_name == "minute"
			for t in minute do
				@photos[t.name] = Flickr.search(t.name)
			end
		end

		if trend_name == "day"
			for t in day do
				@photos[t.name] = Flickr.search(t.name)
			end
		end

		if trend_name == "week"
			for t in week do
				@photos[t.name] = Flickr.search(t.name)
			end
		end
	end
end