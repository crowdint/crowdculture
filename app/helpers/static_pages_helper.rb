module StaticPagesHelper
	def get_img_src(entry)
		idx = entry.index('>');
		if idx != nil
			entry[0, idx].html_safe 
		else
			entry
		end
	end
end
