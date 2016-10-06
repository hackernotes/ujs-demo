class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.by_position
  end

  def show
    # default render
  end

  def create
    respond_to do |format|
      @note = Note.new(note_params)
      
      if @note.save
        format.js # default render (create.js.erb)
      else
        format.js { render 'new' }
      end
    end
  end

  def edit
    # default render
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.js # default render (update.js.erb)
      else
        format.js { render 'edit' }
      end
    end
  end

  def destroy
    @note.destroy
    # default render
  end

  def positions
    respond_to do |format|
      @target = Note.find(params[:target])
      
      params[:positions].values.each do |param|
        Note.find(param[:id]).update!(position: param[:position])
      end

      format.js # default render
    end
  end

  private

  def note_params
    params.fetch(:note, {}).permit(:body)
  end

  def find_note
    @note = Note.find(params[:id])
  end
end