class UsersController < ApplicationController

  def new
    @user = User.new
    @user.build_profile # has one
    #@user = User.questions.build (if has_many)
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thank you for registering!"
    else
      @user.build_profile unless @user.profile.present?
      render :new
    end
  end

private 


  def user_params
  params.require(:user).permit(:email, :password, :password_confirmation, 
                                  {profile_attributes: [:first_name, :last_name, :address, :id]})
  end

end
