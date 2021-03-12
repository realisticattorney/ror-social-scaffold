# rubocop:disable Style/GuardClause
module PostHelper
  def display_errors(post)
    return unless post.errors.full_messages.any?

    content_tag :p, "Post could not be saved. #{post.errors.full_messages.join('. ')}", class: 'errors'
  end

  def delete_post(post)
    if post.user == current_user
      content_tag(:div, (button_to 'Delete Post', post_path(post), method: :delete, class: 'btn btn-danger'))
    end
  end

  def del_btn(user, comment)
    if user == current_user
      content_tag(:div, (button_to 'Delete Comment', post_comment_path(comment.post_id, comment.id), method: :delete))
    end
  end
end
# rubocop:enable Style/GuardClause
