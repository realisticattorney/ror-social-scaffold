module CommentsHelper
    def del_btn(user, comment)
        if user == current_user
        content_tag(:div, (button_to 'Delete Comment', post_comment_path(comment), method: :delete, class: 'btn btn-danger'))
        end
    end

end