class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates_presence_of :nickname, :email
  validates_uniqueness_of :nickname, :email
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
end
