# == Schema Information
#
# Table name: entries
#
#  id                  :integer         not null, primary key
#  feed_id             :integer
#  content_url         :string(255)
#  published_date      :datetime
#  title               :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  entry_id            :string(255)
#  type                :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  box_size            :integer         default(1)
#

require 'spec_helper'

describe Image do
  it {should respond_to(:title)}
  it {should respond_to(:content_url)}
  it {should respond_to(:entry_id)}
  it {should respond_to(:feed_id)}
  it {should respond_to(:published_date)}
  it {should respond_to(:type)}
  it {should respond_to(:box_size)}
  it {should respond_to(:avatar)} 
  it {should be_kind_of(Entry)}
  it {should respond_to(:feed)}
  its(:type) {should == 'Image'}

  describe "When checking for the images height/width ratio" do
    let!(:old)        { Image.create(entry_id:'10', title:'title1', feed_id:'1', published_date:'2008-10-31') }
    let!(:recent)     { Image.create(entry_id:'20', title:'title2', feed_id:'1', published_date:'2009-10-31') }
    let!(:most_recent){ Image.create(entry_id:'30', title:'title3', feed_id:'1', published_date:'2010-10-31') }
    describe "#last_images_added" do
      it "should include the latest Images specified" do
        images = Image.last_images_added(2)
        images.should include(most_recent)
        images.should include(recent)
        images.should_not include(old)
      end
    end

    describe "#increase_box_size" do
      it "should update box_size from 1 to 2" do
        expect { Image.increase_box_size(most_recent) }.to change { most_recent.box_size }.from(1).to(2)
      end
    end

  end
end