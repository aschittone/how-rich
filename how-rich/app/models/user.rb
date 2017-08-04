# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_many :searches
  has_many :stocks, through: :searches
  has_secure_password

#
#   has_many :i_follow, class: "Relationship" foreign_key: "follower_id"
#   has_many :i_am_followed, class_name: "relationship", foreign_key: "follow_id"
#   #show me the row because i care about follower_id
#
#   has_many :followers, class_name: "User", foreign_key: "follower_id", through: :i_am_followed
#
#   has_many :follows, class_name: "User", foreign_key: "follow_id", through: :i_follow
#
# def get_follwers
#   i_am_follow.each_char { |rel|
#   rel.follower  }
# end
#
#

end
