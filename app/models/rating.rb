# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  explanation :text
#  user_rating :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  org_id      :integer
#  user_id     :integer
#
class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :org, class_name: "Organization"
  validates :user_id, uniqueness: { scope: ["org_id"] }
  validates :org_id, presence: true
  validates :user_rating, presence: true
  validates :explanation, presence: true
  validates :user_rating, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }

end
