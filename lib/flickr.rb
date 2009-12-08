require 'net/http'
require 'hpricot'
require 'yaml'

class Flickr
	def self.search(text, per_page = 1)
		config = YAML::load(File.read('./config.yaml'))

		url = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{config['api_key']}&per_page=#{per_page}&tags=#{clean(text)}&tagmode=any"
		xml = Net::HTTP.get(URI.parse(url));

		doc = Hpricot.XML(xml)
		throw "An exception occurred while getting the photos from Flickr." unless doc.at("rsp")["stat"] == "ok"

		if doc.at("photos")["total"].to_i > 0
			(doc/:photos/:photo).collect do |img|
				Image.new(img)
			end
		end
	end

	def self.clean(text)
		text = text.gsub(/[#)...é’]/, "")
		text = text.gsub(/[ ]/, ",")
	end
end