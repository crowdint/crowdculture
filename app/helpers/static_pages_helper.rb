module StaticPagesHelper
  def get_color
    colors[random_number_from_colors]
  end

  def colors
    ["#0075C8", "#8FC754", "#007F73", "#7BC2C2", "#DBDBBF", "#EEB500", "#D64826", "#D06B19", "#402716"]
  end

  def random_number_from_colors
    rand(colors.length)
  end
end