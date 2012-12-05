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

describe Link do
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
  its(:type) {should == 'Link'}
end