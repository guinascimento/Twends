class Image
	attr_reader :farm, :server, :id, :secret

	def initialize(doc)
		@farm = doc["farm"]
		@server = doc["server"]
		@id = doc["id"]
		@secret = doc["secret"]
	end

	def url(image_type = "m")
		"http://farm#{farm}.static.flickr.com/#{server}/#{id}_#{secret}_#{image_type}.jpg"
	end
end