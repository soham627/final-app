# == Schema Information
#
# Table name: interested_industries
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  industry_id :integer
#  user_id     :integer
#
class InterestedIndustry < ApplicationRecord
  belongs_to :user
  belongs_to :industry
  validates :user_id, presence: true
  validates :industry_id, presence: true
  #validates :industry_id, uniqueness: { scope: ["user_id"], message: "You've already liked this industry" }

end
