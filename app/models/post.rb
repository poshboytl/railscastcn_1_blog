class Post < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  validates :content, :presence => true

  has_many :comments
  has_many :taggings
  has_many :tags, :through => :taggings

  scope :tag_with, lambda{|tag_name| include(:tags).where("tags.name = ?", tag_name)}
  scope :latter_than, lambda{|time| joins(:taggings).where("taggings.created_at > ?", time)}

  # Post.tag_with("yujie")
  #

  #def self.tag_with(tag_name)
    #Tag.find_by_name(tag_name).try(:posts)
  #end
end
