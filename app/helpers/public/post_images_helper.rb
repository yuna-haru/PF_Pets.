module Public::PostImagesHelper
  def render_with_hashtags(hashtag, adminFlg=false)
    if adminFlg
      hashtag.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/public/post_image/hashtag/#{word.delete("#").delete("＃")}",data: {"turbolinks" => false}, target: :_blank }.html_safe
    else
      hashtag.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/public/post_image/hashtag/#{word.delete("#").delete("＃")}",data: {"turbolinks" => false} }.html_safe
    end
  end
end
