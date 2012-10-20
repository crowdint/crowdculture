module StaticPagesHelper
	def get_img_src(entry)
		html = Nokogiri::HTML(entry)
		img = html.css('img/@src')
	end
end
