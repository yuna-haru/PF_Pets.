class Hashtag < ApplicationRecord
  validates :hashtag, presence: true, length: {maximum:99}
  has_many :post_image_hashtags, dependent: :destroy
  has_many :post_images, through: :post_image_hashtags
end
