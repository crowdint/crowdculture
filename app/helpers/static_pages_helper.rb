module StaticPagesHelper
	def get_img_src(entry)
		html = Nokogiri::HTML(entry)
		img = html.css("img")
		img.to_html.html_safe
	end

	def get_title(entry)
		html = Nokogiri::HTML(entry)
		h1 = html.css("h1")
		h1.to_html.html_safe
	end
	def get_p(entry)
		html = Nokogiri::HTML(entry)
		p = html.css("p")
		p.to_html.html_safe
	end
end
