# == Schema Information
#
# Table name: stocks
#
#  id            :integer          not null, primary key
#  name          :string
#  ticker_symbol :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Stock < ApplicationRecord
  has_many :searches
  has_many :users, through: :searches
end
