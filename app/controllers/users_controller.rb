class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to root_path, notice: "Your profile was updated!"
    else
      redirect_to root_path, notice: "Something went wrong"
    end
  end

  def user_params
    params.require(:user).permit(:full_name, :photo)
  end
end
