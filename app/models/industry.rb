# == Schema Information
#
# Table name: industries
#
#  id         :integer          not null, primary key
#  jobs_count :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Industry < ApplicationRecord
  has_many  :jobs, dependent: :destroy
  has_many  :interested_industries, dependent: :destroy
  has_many :likers, through: :interested_industries, source: :user
  validates :name, presence: true
  validates :name, uniqueness: true

end
