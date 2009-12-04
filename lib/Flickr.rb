require 'net/http'
require 'hpricot'
require 'Photo'

class Flickr
	def Flickr.search(text, per_page = 1)
		text = clean(text)

		url = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=da0e80ad7b47166b7fc008a1e4ac604f&per_page=#{per_page}&tags=#{text}&tagmode=any"
		xml = Net::HTTP.get(URI.parse(url));

		doc = Hpricot.XML(xml)
		throw "An exception occurred while getting the photos from Flickr." unless doc.at("rsp")["stat"] == "ok"

		if doc.at("photos")["total"].to_i > 0
			(doc/:photos/:photo).collect do |p|
				Photo.new(p)
			end
		end
	end

	def Flickr.clean(text)
		text = text.gsub(/[#)...é’]/, "")
		text = text.gsub(/[ ]/, ",")
	end
end