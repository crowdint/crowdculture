# == Schema Information
#
# Table name: feeds
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  author     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Feed < ActiveRecord::Base
  attr_accessible :author, :url
  has_many :entries
end
