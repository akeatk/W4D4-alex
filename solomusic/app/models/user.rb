class User < ApplicationRecord
  validates :email, :session_token, presence:true, uniqueness:true
  validates :session_token, presence:true
  validates :password, length: {minimum: 6, allow_nil: true}
  
  after_initialize :ensure_session_token
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end
  
  def self.find_by_credentials(password, email)
    @user = User.find_by(email: email)
    if @user && @user.is_password?(password)
      @user
    else
      nil
    end
  end
  
  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64
    save!
    self.session_token
  end
  
  def password
    @password
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    nil
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  private
  def ensure_session_token
      self.session_token ||= SecureRandom::urlsafe_base64
  end
end
