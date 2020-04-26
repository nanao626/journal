class DiariesController < ApplicationController
  
  def index
    @diaries = Diary.all
    @diary = Diary.new
    
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def create
    @diary = Diary.new(diary_params)
		@diary.user_id = current_user.id
  	if @diary.save 
  		redirect_to diary_path(@diary), notice: "successfully created book!"
  	else
			@diaries = Diray.all
  		render 'index'
  	end
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path, notice:"削除しました"
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = diary.find(params[:id])
    if @diray.update(diary_params)
      redirect_to diaries_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :content, :start_time)
  end

end
