class SessionsController < ApplicationController
  def new
  end
# user login
  def create
  @user = User.find_by_email(params[:session][:email])
  if @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    redirect_to current_user
  else
    redirect_to 'login'
  end
end
# user logout
def destroy
  session[:user_id] = nil
  redirect_to '/'
end
end
