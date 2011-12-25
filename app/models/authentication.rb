class Authentication < ActiveRecord::Base
  validates :provider, :presence => true, :uniqueness => {:scope => :user_id}
  validates :uid, :presence => true, :uniqueness => {:scope => :provider}
  belongs_to :user
end
