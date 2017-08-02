class Search < ApplicationRecord
  belongs_to :stock, required: false
  belongs_to :user, required: false

end
