class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_attached_file :avatar, styles: { large: "400x400>", medium: "200x200>", thumb: "100x100>" }

 validates_attachment :avatar, presence: true, content_type: { content_type: ["image/jpeg", "image/png"], message: "Only JPEG & PNG formats allowed" }

  has_many :posts
  has_many :likes
  has_many :comments

  has_many :liked_posts, through: :likes, source: :post

  has_many :out_friend_requests, class_name: 'FriendRequest', foreign_key: 'requester_id', dependent: :destroy
  has_many :in_friend_requests, class_name: 'FriendRequest', foreign_key: 'requestee_id', dependent: :destroy

  has_many :friendships, foreign_key: 'one_id'
  has_many :friendships, foreign_key: 'two_id'

  has_many :friends,  through: :friendships, source: 'two'
  has_many :friends,  through: :friendships, source: 'one'

  def full_name
    first_name + " " + last_name
  end
end
