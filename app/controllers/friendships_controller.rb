class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    friendship = Friendship.new(follower_id: current_user.id, followed_user_id: @user.id)

    if friendship.save
      flash[:notice] = "Success"
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    Friendship.destroy_by(follower_id: current_user.id, followed_user_id: @user.id)
    redirect_to @user
  end
end
