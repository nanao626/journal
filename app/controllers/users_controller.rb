class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @todolists = @user.todolists
    @diaries = @user.diaries
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end

end
