require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:body) }
  end
  
  describe 'associations' do
    it { should belong_to(:model) }
    it { should belong_to(:author) }
  end

end
