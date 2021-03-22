module Api
  class NotesController < ApplicationController
    def index
      notes = Note.all
      render json: {notes: notes}, status: :ok
    end

    def show
      note = Note.find(params[:id])
      render json: note, status: :ok
    end

    def create
      note = Note.new(note_params)
      if note.save
        render json: note, status: :created
      else
        render json: note.errors, status: :bad_request
      end
    end

    def update
      note = Note.find(params[:id])
      if note.update(note_params)
        render json: note, status: :ok
      else
        render json: note.errors, status: :bad_request
      end
    end

    def destroy
      if Note.destroy(params[:id])
        head(:ok)
      else
        head(:bad_request)
      end
    end

    def note_params
      params.require(:note).permit(:text, :diary_id)
    end
  end
end
