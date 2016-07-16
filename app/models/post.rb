# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  user_id            :integer
#

class Post < ActiveRecord::Base
  acts_as_votable
  acts_as_taggable

  belongs_to :user
  has_many :comments

  has_attached_file :image, styles:  { large: "2400x1600#", medium: "600x400>", small: "200x150>" }
  validates_attachment :image, presence: true,
                       content_type: { content_type: /\Aimage\/.*\Z/ },
                       size: { in: 0..2.megabytes }
  self.per_page = 10

  validates :title, presence: true


end
