class InterestedIndustry < ApplicationRecord
  belongs_to :user
  belongs_to :industry
  validates :user_id, presence: true
  validates :industry_id, presence: true
  validates :industry_id, uniqueness: { scope: ["user_id"], message: "You've already liked this industry" }

end
