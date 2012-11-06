module StaticPagesHelper
  def get_color
    colors_a = ["#7bc3c3", "#008074", "#0076c8", "#d04524"]
    colors_a[rand(colors_a.length)]
  end
end