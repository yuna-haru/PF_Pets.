class PostImageHashtag < ApplicationRecord
  belongs_to :hashtag_id
  belongs_to :post_image_id
  validates  :hashtag_id, presence: true
  validates  :post_image_id, presence: true
end
