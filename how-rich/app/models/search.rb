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

class Search < ApplicationRecord
  belongs_to :stock, required: false
  belongs_to :user, required: false

  # def shares
  #   (investment_amount / buy_price).floor
  # end
  #
  # def invested_money
  #   invested_money = (shares * buy_price).round(2)
  # end
  #
  #
  # def biggest_gain_global
  #   max = 0
  #   Search.all.map do |query|
  #     next if query[:investment_amount].nil? || query[:buy_price].nil?
  #     if (query[:investment_amount] / query[:buy_price]).floor * query[:investment_amount] > max
  #       max = (query[:investment_amount] / query[:buy_price]).floor * query[:investment_amount]
  #     end
  #   end
  #   max
  #
  # end
  #
  # def biggest_loss_global
  #
  # end
  #
  # def biggest_gain_user
  #
  # end
  #
  # def biggest_loss_user
  #
  # end
  #


end
