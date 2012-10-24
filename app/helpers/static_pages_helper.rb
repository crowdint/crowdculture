module StaticPagesHelper
  def get_img_src(entry)
    html = Nokogiri::HTML(entry)
    img = html.css('img/@src')
  end

  def sort_entries(entries)
    entries_sorted = entries.sort_by { |i| i.published}.reverse
  end

  def get_author(entry)
    if entry.index('culture') != nil
      author = 1
    elsif entry.index('amazonaws') != nil
      author = 3
    else 
      author = 2
    end
    author
  end
end
