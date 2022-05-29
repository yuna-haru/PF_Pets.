module Public::PostImagesHelper
  def render_with_hashtags(hashtag)
    hashtag.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/public/post_image/hashtag/#{word.delete("#").delete("＃")}",data: {"turbolinks" => false} }.html_safe
  end
end
