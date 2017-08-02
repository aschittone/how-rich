# == Schema Information
#
# Table name: searches
#
#  id                :integer          not null, primary key
#  buy_price         :float
#  sell_price        :float
#  start_date        :datetime
#  end_date          :datetime
#  investment_amount :integer
#  stock_id          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#

require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
