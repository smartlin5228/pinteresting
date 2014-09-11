class Pin < ActiveRecord::Base
	belongs_to :user

	validates :image, presence: true
	validates :description, presence: true
end
