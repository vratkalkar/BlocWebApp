class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :avatar, :email_favorites)
end
