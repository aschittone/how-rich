# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  follow_id   :integer
#  follower_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
