class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments

  has_attached_file :image, styles:  { large: "800x600>", medium: "400x300>", small: "200x150>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end