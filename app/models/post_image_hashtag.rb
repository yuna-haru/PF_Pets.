class PostImageHashtag < ApplicationRecord
  belongs_to :hashtag
  belongs_to :post_image
  validates  :hashtag_id, presence: true
  validates  :post_image_id, presence: true
end
