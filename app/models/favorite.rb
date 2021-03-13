# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  job_id     :integer
#  user_id    :integer
#
class Favorite < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :job
  validates :user_id, presence: true
  validates :job_id, presence: true
  #validates :job_id, uniqueness: { scope: ["user_id"] }

end
