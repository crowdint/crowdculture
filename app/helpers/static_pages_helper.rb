module StaticPagesHelper
  def get_color
    colors_a = ["#0075C8", "#8FC754", "#007F73", "#7BC2C2", "#DBDBBF", "#EEB500", "#D64826", "#D06B19", "#402716"]
    colors_a[rand(colors_a.length)]
  end

  def check_landscape(avatar)
    photo_path = (avatar.options[:storage] == :s3) ? avatar.url : avatar.path
    geo ||= Paperclip::Geometry.from_file(photo_path)
    true if geo.width / geo.height > 1.8 
  end
end