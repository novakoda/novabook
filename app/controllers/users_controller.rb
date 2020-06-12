class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @post = current_user.posts.new if @user == current_user
  end

  def friend_request
    unless current_user.out_friend_requests.any?{ |f| f.requestee_id.to_i == params[:requestee_id].to_i }
      fr = current_user.out_friend_requests.new
      fr.requestee_id = params[:requestee_id]
      fr.requester_id = current_user.id
      fr.save
      flash[:alert] = 'Friend request sent.'
    else
      flash[:alert] = 'Already sent friend request'
    end
    redirect_to home_path
  end

  def befriend
    f = FriendRequest.find(params[:friendship_id])
    if f.requestee == current_user && get_all_friends.none?(f.requester)
      friendship = current_user.friendships.new
      friendship.one = current_user
      friendship.two = f.requester
      friendship.save
      f.destroy
    end
    redirect_to home_path
  end

  def notifications
    @sent_requests = current_user.out_friend_requests
    @incoming_requests = current_user.in_friend_requests
  end

  private

    def get_all_friends
      current_user.friendships.map{ |f| f.two }
    end
end
