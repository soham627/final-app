# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  org_id     :integer
#  user_id    :integer
#
class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :org, class_name: "Organization"
  validates :user_id, uniqueness: { scope: ["org_id"] }
  validates :org_id, presence: true

end
