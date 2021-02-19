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

  def list(u)
    @list = []
    u.friends.each do |f|
     list << f.friend.name
    end
     @list
  end

  def reverse_friends(u)
    u.friends.each do |f|
      Friend.create(user_id: f.friend_id , friend_id: u.id )
    end
  end
  
end
