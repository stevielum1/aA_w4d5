# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :password_digest, :session_token, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  
  after_initialize :ensure_session_token
  
  has_many :goals,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Goal
  
  has_many :comments,
    as: :model
    
  has_many :authored_comments,
    foreign_key: :author_id,
    class_name: :Comment
  
  # has_many :authored_user_comments,
  #   foreign_key: :author_id,
  #   class_name: :UserComment
  # 
  # has_many :authored_goal_comments,
  # foreign_key: :author_id,
  # class_name: :GoalComment
  # 
  # has_many :comments,
  #   foreign_key: :user_id,
  #   class_name: :UserComment
    
  
  attr_reader :password
  
  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    user.is_password?(password) ? user : nil    
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end  
  
  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = generate_session_token
    self.save
    self.session_token
  end
  
  def completed_goals
    self.goals.where(complete: true)
  end
end
