# rubocop:disable Layout/LineLength
module FriendshipsHelper
  def friendship_button(other_user)
    if current_user.friend?(other_user)
      path = if Friendship.where(user: other_user, friend: current_user).first.nil?
               Friendship.where(user: current_user, friend: other_user).first
             else
               Friendship.where(user: other_user, friend: current_user).first
      end
      content_tag(:div, (button_to 'Unfriend', friendship_path(path), method: :delete, class: 'btn btn-danger'))

    elsif current_user.pending?(other_user)
      'Awaiting for response'
    elsif current_user.requested?(other_user)
      content_tag(:div, (button_to 'Accept Friendship', accept_friendship_path(Friendship.where(user: other_user, friend: current_user).first), method: :post) +
      (button_to 'Reject Friendship', reject_friendship_path(Friendship.where(user: other_user, friend: current_user).first), method: :post))
    else
      unless current_user.id == other_user.id
        content_tag(:div,
                    (button_to 'Add as friend',
                               friendships_path(params: { friendship: { friend_id: other_user.id, user_id: current_user.id } }),
                               method: :post, class: 'button-friendship'), class: 'button-friendship')
      end
    end
  end
end
# rubocop:enable Layout/LineLength
