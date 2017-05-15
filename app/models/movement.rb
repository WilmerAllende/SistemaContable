class Movement < ApplicationRecord
	has_many :deals, inverse_of: :movement
	accepts_nested_attributes_for :deals,
																	reject_if: :all_blank,
																	allow_destroy: true
end
