# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    user = User.find_by(email: params[:user][:email])
    if user.nil?
      flash[:error] = "Invalid Email"
      redirect_to new_user_session_path
    elsif !user.valid_password?(params[:user][:password]) 
      flash[:error] = "Invalid Password"
      redirect_to new_user_session_path
    else
      super
    end
  end
end
