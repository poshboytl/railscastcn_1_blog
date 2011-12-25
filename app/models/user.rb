class User < ActiveRecord::Base
  validates :nickname, :presence => true
  validates :email, :presence => true, :uniqueness => true
  has_many :authentications

  accepts_nested_attributes_for :authentications

  class << self
    def from_auth(auth)
      Authentication.find_by_provider_and_uid(auth[:provider],
                                              auth[:uid]).try(:user) ||
        create!(
          :nickname => auth[:info][:nickname],
          :email => auth[:info][:email],
          :authentications_attributes => [
            Authentication.new(:provider => auth[:provider],
                               :uid => auth[:uid]
                              ).attributes
      ])
    end
  end

end
