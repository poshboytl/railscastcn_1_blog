class Post < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  validates :content, :presence => true

  has_many :comments
end
