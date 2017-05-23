class Account < ApplicationRecord
  has_many :deals
  validates :name, presence: true
end
