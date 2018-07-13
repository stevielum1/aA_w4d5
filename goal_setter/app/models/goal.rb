# == Schema Information
#
# Table name: goals
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  public      :boolean          default(TRUE), not null
#  complete    :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Goal < ApplicationRecord
  validates :title, :description, presence: true
  validates :public, :complete, inclusion: { in: [ true, false ] }
  
  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User
end
