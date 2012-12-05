require File.dirname(__FILE__) + '/../spec_helper'

describe StaticPagesHelper do
  describe "#get_color" do
    it "should return an hexadecimal number starting with #" do
      color = get_color
      color.should =~ /[#]\h{6}/
    end
  end

  describe "#colors" do
    it "should return an hexadecimal number starting with #" do
      color = get_color
      color.should =~ /[#]\h{6}/
    end
  end

  describe "#random_number_from_colors" do
    it "should get a random number from 0..colors.length" do
      random_number_from_colors.should >= 0
      random_number_from_colors.should <= 8
    end
  end
end