 
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
                #Friend.create(user_id: user.id, friend_id: current_user.id)


                content_tag(:div,(button_to 'Add',
                           friends_path(params: { friend: { user_id: user.id, friend_id: current_user.id } }),
                           method: :post, class: 'button-add'), class: 'button-add')
            end
        end
        end
    end

    def pending_friends()
        list = "<ul>"
             if @user == current_user
                list += "<h3> Your Friend's Waiting List </h3>"
                @user.pending_list.each do |watining_friends|
                    list += "<li> <p> #{link_to  watining_friends.friend.name , user_path(watining_friends.friend.id)} </p></li>"
                    list += "<li> <p> #{link_to  'Accept' , friend_path(watining_friends.id) , method: :put} </p> </li>"
                    list += "<li> <p> #{link_to  'Reject' , friend_path(watining_friends.id) , method: :delete} </p> </li>"
                end
            end
        list += "</ul>"
        list.html_safe
    end

    def friends_list()
        list = "<ul>"
        if @user == current_user
           list += "<h3> Your Friend</h3>"
           @user.friends_list.each do |friend|
               list += "<li> <p> #{link_to  friend.name , user_path(friend.id)} </p></li>"   
           end
       end
   list += "</ul>"
   list.html_safe
    end

end



    