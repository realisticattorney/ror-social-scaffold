module CommentsHelper
  def del_btn(user, comment)
    content_tag(:div, (button_to 'Delete Comment', post_comment_path(comment), method: :delete)) if user == current_user
  end
end
