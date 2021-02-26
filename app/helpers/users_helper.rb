module UsersHelper
  def aivable_friend(user)
    Friend.where('(user_id = ? and friend_id = ?) OR (user_id = ? and friend_id = ?)', current_user.id, user.id,
                 user.id, current_user.id).first
  end

  def friends_posts(user)
    render @posts if current_user.friends_list.include?(user)
  end

  def create_friend(user)
    return unless aivable_friend(user).nil?

    content_tag(:div, (button_to 'Add',
                                 friends_path(params: { friend: { user_id: user.id, friend_id: current_user.id } }),
                                 method: :post, class: 'button-add'), class: 'button-add')
  end

  def pending_friends()
    list = '<ul>'
    if @user == current_user
      list += "<h3> Your Friend's Waiting List </h3>"
      @user.pending_list.each do |watining_friends|
        list += "<li> <p> #{link_to watining_friends.friend.name,
                                    user_path(watining_friends.friend.id)} </p></li>"
        list += "<li> <p> #{link_to 'Accept', friend_path(watining_friends.id), method: :put} </p> </li>"
        list += "<li> <p> #{link_to 'Reject', friend_path(watining_friends.id),
                                    method: :delete} </p> </li>"
      end
    end
    list += '</ul>'
    list.html_safe
  end

  def friends_list()
    list = '<ul>'
    if @user == current_user
      list += '<h3> Your Friend</h3>'
      @user.friends_list.each do |friend|
        list += "<li> <p> #{link_to friend.name, user_path(friend.id)} </p></li>"
      end
    end
    list += '</ul>'
    list.html_safe
  end
end
