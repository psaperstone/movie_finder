class User < ActiveRecord::Base
  def create
    @users = User.new
  end

  def show
    @users = User.all
  end
end
