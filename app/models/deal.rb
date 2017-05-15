class Deal < ApplicationRecord
  belongs_to :account
  belongs_to :movement
end
