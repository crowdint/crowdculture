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

require 'spec_helper'

describe Feed do
  pending "add some examples to (or delete) #{__FILE__}"
end