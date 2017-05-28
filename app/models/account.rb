class Account < ApplicationRecord
  has_many :deals
  validates :name, presence: true
  validates :codigo, presence: true
  searchkick word_start: [:codigo, :name]

  def search_data
    {
      codigo: codigo,
      name: name
    }
  end
end
