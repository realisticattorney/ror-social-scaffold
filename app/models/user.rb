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
  has_many :inverted_friends, class_name: 'Friend', foreign_key: 'friend_id'

  def pending_list
    pending_list = []
    friends.map do |friend|
      pending_list << friend if friend.status.nil?
    end
    pending_list
  end

  def pending_list_show
    inverted_friends.map { |friend| friend.user if friend.status.nil? }.compact
  end

  def friends_list
    @friends_list = []
    friends.each do |f|
      @friends_list << f.friend if f.status == true
    end
    @friends_list
  end
end
