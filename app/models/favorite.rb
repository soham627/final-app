class Favorite < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :job
  validates :user_id, presence: true
  validates :job_id, presence: true
  validates :job_id, uniqueness: { scope: ["user_id"] }

end
