 
module UsersHelper
    def friends_posts(user)
       if current_user.friends_list.include?(user) 
        render  @posts
       end
    end

    def create_friend(user)
        if user != current_user
            if user != nil
             if (!current_user.pending_list_show.include?(user) && !user.pending_list_show.include?(current_user))&& !current_user.friends_list.include?(user)
                Friend.create(user_id: user.id, friend_id: current_user.id)


                content_tag(:div,(button_to 'Add',
                           friends_path(params: { friend: { friend_id: user.id, user_id: current_user.id } }),
                           method: :post, class: 'button-add'), class: 'button-add')
            end
        end
        end
    end
end
    