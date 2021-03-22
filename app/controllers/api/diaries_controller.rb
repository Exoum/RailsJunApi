module Api
  class DiariesController < ApplicationController
    def index
      diaries = Diary.all
      render json: {diaries: diaries}, status: :ok
    end

    def show
      diary = Diary.find(params[:id])
      render json: diary, status: :ok
    end

    def create
      diary = Diary.new(diary_params)
      if diary.save
        render json: diary, status: :created
      else
        render json: diary.errors, status: :bad_request
      end
    end

    def update
      diary = Diary.find(params[:id])
      if diary.update(diary_params)
        render json: diary, status: :ok
      else
        render json: diary.errors, status: :bad_request
      end
    end

    def destroy
      if Diary.destroy(params[:id])
        head(:ok)
      else
        head(:bad_request)
      end
    end

    def diary_params
      params.require(:diary).permit(:title, :expiration, :kind)
    end
  end
end
