class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = Friend.new(friend_params)
    # @friend_id = @friend.friend_id 
     if @friend.save 
     Friend.create!(user_id:@friend.friend_id , friend_id: current_user.id)
     redirect_to user_path(current_user)
     flash[:notice] =
        "You Sent Friend request to #{@friend.friend.name}"
    else
      redirect_to users_path
      flash[:notice] =
        "You already Added #{@friend.friend.name} to your list"
    end
   
  end

  

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    @friend_one = Friend.where(user_id:current_user.id , friend_id: @friend.friend_id)
    @friend_one.update(status: true)
    @friend_reverse = Friend.where(user_id:@friend.friend_id , friend_id: current_user.id)
    @friend_reverse.update(status: true)
        flash[:notice] =
        "You and #{@friend.friend.name} are now Friends ! "
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:user_id, :friend_id, :status)
    end
end
