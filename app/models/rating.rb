class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :org, class_name: "Organization"
  validates :user_id, uniqueness: { scope: ["org_id"] }
  validates :org_id, presence: true

end
