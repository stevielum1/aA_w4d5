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


require 'rails_helper'

RSpec.describe Goal, type: :model do
  
  # subject(:goal) { Goal.create!(title: 'title stuff', description: 'this is the description', user_id: 1, public: true, complete: false) } 
  # # subject(:goal) do
  #   FactoryBot.build(:goal,
  #     title: "title of goal",
  #     description: "description of goal",
  #     user_id: 1)
  # end
  
  # describe 'validations' do
  #   subject(:goal) { Goal.create!(title: 'title stuff', description: 'this is the description', user_id: 1, public: true, complete: false) } 
  #   it { should validate_presence_of(:title) }
  #   it { should validate_presence_of(:description) }
  #   it { should validate_inclusion_of(:public).in_array(['true', 'false']) }
  #   it { should validate_inclusion_of(:complete).in_array(['true', 'false']) }
  # end
  # 
  # describe 'associations' do
  #   it { should belong_to(:user) }
  # end
end
