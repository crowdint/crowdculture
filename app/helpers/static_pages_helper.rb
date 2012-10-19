module StaticPagesHelper
	def get_img_src(entry)
		html = Nokogiri::HTML(entry)
		img = html.css("img")
		img.to_html.html_safe
	end
end
