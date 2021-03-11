class Industry < ApplicationRecord
  has_many  :jobs, dependent: :destroy
  has_many  :interested_industries, dependent: :destroy
  has_many :likers, through: :interested_industries, source: :user
  validates :name, presence: true
  validates :name, uniqueness: true

end
