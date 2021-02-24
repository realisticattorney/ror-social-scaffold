class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friends

  # def reverse_add_friends(user , user_friend)
  #   user_friend.friends.create(friend_id: user.id)
  # end

  def pending_list
    pending_list = []
    friends.each do |f|
      pending_list << f if f.status.nil?
    end
    pending_list
  end

  def pending_list_show
    pending_list_show = []
    friends.each do |f|
      pending_list_show << f.friend if f.status.nil?
    end
    pending_list_show
  end

  def friends_list
    @friends_list = []
    friends.each do |f|
      @friends_list << f.friend if f.status == true
    end
    @friends_list
  end

  def accept_request(user, user_friend)
    user.friends.where(friend_id: user_friend.id).update!(status: true)
    user_friend.friends.where(friend_id: user.id).update!(status: true)
  end

  # def reverse_friends(user)
  #   user.friends.each do |f|
  #     Friend.create(user_id: f.friend_id, friend_id: u.id, status: true)
  #   end
  # end

  # def friend?(user)
  #   if @friends_list.nil?
  #     false
  #   elsif @friends_list.include?(user)
  #     true
  #   else
  #     false
  #   end
  # end
end
