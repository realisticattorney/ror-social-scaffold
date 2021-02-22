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

  def add_friends(user_friend , user)
    user.friends.create(friend_id: user_friend.id)
    user_friend.friends.create(friend_id: user.id)
  end

  def accept_request(user_friend)
    friends.where(friend_id: user_friend.id).update(status: true).save
  end

  def pending_list
    pending_list = []
    friends.each do |f|
      if f.status == nil
      pending_list << f.friend
     end
    end
     pending_list
  end

  def friends_list
    @friends_list = []
    friends.each do |f|
      if f.status == true
    @friends_list << f.friend
      end
    end
    @friends_list
  end

  def reverse_friends(u)
    u.friends.each do |f|
      Friend.create(user_id: f.friend_id , friend_id: u.id , status: true )
    end
  end


  def is_friend(user)
    @friends_list.include?(user)

  end

 
  
end
