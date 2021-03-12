# == Schema Information
#
# Table name: jobs
#
#  id           :integer          not null, primary key
#  deadline     :date
#  description  :text
#  int_students :boolean
#  link         :string
#  role         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  industry_id  :integer
#  org_id       :integer
#  poster_id    :integer
#
class Job < ApplicationRecord
  has_many  :favorites, dependent: :destroy
  belongs_to :industry, counter_cache: true
  belongs_to :org, class_name: "Organization"
  belongs_to :poster, class_name: "User"
  has_many :likers, through: :favorites, source: :user
  validates :role, presence: true
  validates :org_id, presence: true
  #validates :link, format: { with: "/((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/" }
  validates :link, presence: true
  validates :int_students, presence: true
  validates :industry_id, presence: true
  validates :deadline, presence: true
  validates :poster_id, presence: true
  
end
