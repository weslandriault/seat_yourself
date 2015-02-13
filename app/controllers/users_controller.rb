class UsersController < ApplicationController
  
  def find_user
    User.find(params[:id])
  end

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

    if @user.save
    	redirect_to restaurants_url, notice:"Signed up!"
    else
    	render :new
    end
  end

  def edit
  	@user = find_user
  end

  def update
  	@user = find_user
  	if @user.update_attributes(user_params)
  		redirect_to restaurants_url, notice:"Just updated user brahh!"
  	else
  		render :edit
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
