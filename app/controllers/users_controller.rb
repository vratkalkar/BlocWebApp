class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :avatar, :email_favorites)
  end

  def index
    @users = User.top_rated.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = current_user
    @post = @user.posts.visible_to(current_user)
  end
end
