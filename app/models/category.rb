class Category < ApplicationRecord
	has_many :doctors, dependent: :nullify

	validates :name, presence: true, uniqueness: true 
end
