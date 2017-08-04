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

class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  #belongs to a user, but we're calling it a follower
  belongs_to :follow, class_name: "User"
end
