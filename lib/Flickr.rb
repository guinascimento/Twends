require 'net/http'
require 'rexml/document'
require 'ostruct'

class Flickr < OpenStruct
	include REXML

	def Flickr.search(text, per_page = 1)
		text = clean(text)

		doc = Document.new(
			Net::HTTP.get(
				URI.parse("http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=da0e80ad7b47166b7fc008a1e4ac604f" + "&per_page=#{per_page}&tags=#{text}&tagmode=any")))

		 throw "flickr error" unless doc.root.attributes['stat'] == "ok"
		 doc.root.elements['photos'].get_elements('//photo').collect {|photo| photo << Flickr.new(photo) }
	end

	def initialize(e)
		super(e.attributes)
		self.new_ostruct_member("photo_id")
		self.photo_id = e.attributes['id']
	end

	def url(image_type = "m")
		"http://farm#{farm}.static.flickr.com/#{server}/#{photo_id}_#{secret}_#{image_type}.jpg"
	end

	def Flickr.clean(text)
		text = text.gsub(/[#) ... é ’]/, "")
	end
end