class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many  :favorites, dependent: :destroy
  has_many  :ratings, dependent: :destroy
  has_many  :interested_industries, dependent: :destroy
  has_many :jobs, through: :favorites, source: :job
  has_many :liked_industries, through: :interested_industries, source: :industry

end
