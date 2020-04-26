class TodolistsController < ApplicationController

  def index
		@todolists = Todolist.all
		@todolist = Todolist.new
		@diaries = Diary.all
  end

  def create
		@todolist = Todolist.new(todolist_params)
		@todolist.user_id = current_user.id
  	if @todolist.save
  		redirect_to todolists_path, notice: "successfully created todolist!"
  	else
			@todolists = todolist.all
  		render 'index'
  	end
	end

  def edit
		@todolist = Todolist.find(params[:id])
  end


  def update
  	@todolist = Todolist.find(params[:id])
  	if @todolist.update(todolist_params)
  		redirect_to @todolist, notice: "successfully updated todolist!"
  	else
  		render "edit"
  	end
  end

  def destroy
  	@todolist = Todolist.find(params[:id])
  	@todolist.destroy
  	redirect_to todolists_path, notice: "successfully delete todolist!"
  end

  private

  def todolist_params
  	params.require(:todolist).permit(:title, :content)
	end

	def correct_user
		@user = User.find(params[:id])
		unless @user
			redirect_to(root_url) unless current_user?(@user)
		end
	end

end
