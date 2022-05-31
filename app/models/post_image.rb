class PostImage < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :post_image_hashtags, dependent: :destroy
  has_many :hashtags, through: :post_image_hashtags

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end



  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  after_create do
    post_image = PostImage.find_by(id: id)
    hashtags  = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashtag: hashtag.downcase.delete('#').delete('＃'))
      post_image.hashtags << tag
    end
  end
  before_update do
    post_image = PostImage.find_by(id: id)
    post_image.hashtags.clear
    hashtags  = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashtag: hashtag.downcase.delete('#').delete('＃'))
      post_image.hashtags << tag
    end
  end

end
