module StaticPagesHelper
  def get_color
    colors_a = ["#0075C8", "#8FC754", "#007F73", "#7BC2C2", "#DBDBBF", "#EEB500", "#D64826", "#D06B19", "#402716"]
    colors_a[rand(colors_a.length)]
  end
end