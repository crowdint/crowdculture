module StaticPagesHelper
	def get_img_src(entry)
		html = Nokogiri::HTML(entry)
		img = html.css('img/@src')
	end

	def sort_entries(entries)
		entries_sorted = entries.sort_by { |i| i.published}.reverse
  end
end
