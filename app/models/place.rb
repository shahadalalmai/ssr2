class Place < ApplicationRecord
  belongs_to :user
  # belongs_to :place 
  has_many :favorites, dependent: :destroy
end
