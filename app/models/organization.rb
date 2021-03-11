# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Organization < ApplicationRecord
  has_many  :jobs, foreign_key: "org_id", dependent: :destroy
  has_many  :ratings, foreign_key: "org_id", dependent: :destroy
  validates :website, presence: true
  validates :name, presence: true
  validates :name, uniqueness: { scope: ["website"], message: "Org already exists" }

end
