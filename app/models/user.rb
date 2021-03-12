# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  bio             :text
#  email           :string
#  favorites_count :integer
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many  :favorites, dependent: :destroy
  has_many  :ratings, dependent: :destroy
  has_many  :interested_industries, dependent: :destroy
  has_many :jobs, through: :favorites, source: :job
  has_many :liked_industries, through: :interested_industries, source: :industry

  has_many  :postings, class_name: "Job", foreign_key: "poster_id", dependent: :destroy


end
