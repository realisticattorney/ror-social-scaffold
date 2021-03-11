class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all
  end

  def new
    @friendship = Friendship.new(friendship_params)
  end

  def create
    @friendship = Friendship.create!(friendship_params)

    if @friendship.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def confirm
    friendship = Friendship.find(params[:id])
    friendship.confirmed = true
    friendship.save
    redirect_to users_path
  end

  def reject
    friendship = Friendship.find(params[:id])
    friendship.confirmed = false
    user = User.find(friendship.user_id)
    friend = User.find(friendship.friend_id)
    Friendship.where(user: user, friend: friend).first.delete
    friendship.save
    redirect_to users_path
  end

  def destroy
    user = User.find(current_user.id)
    friend = if User.find(Friendship.find(params[:id]).friend_id) == user
               User.find(Friendship.find(params[:id]).user_id)
             else
               User.find(Friendship.find(params[:id]).friend_id)
             end
    @friendship = if Friendship.where(user: user, friend: friend).first.nil?
                    Friendship.where(user: friend, friend: user).first
                  else
                    Friendship.where(user: user, friend: friend).first
                  end
    @friendship.destroy!
    redirect_to users_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmed, :id)
  end
end
