class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  has_many :out_friend_requests, class_name: 'FriendRequest', foreign_key: 'requester_id', dependent: :destroy
  has_many :in_friend_requests, class_name: 'FriendRequest', foreign_key: 'requestee_id', dependent: :destroy

  has_many :friendships, foreign_key: 'one_id'
  has_many :friendships, foreign_key: 'two_id'

  def full_name
    first_name + " " + last_name
  end
end
