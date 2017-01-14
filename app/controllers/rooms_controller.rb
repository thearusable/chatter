class RoomsController < ApplicationController
  def index
    @rooms = Room.paginate(page: params[:page], per_page: 20).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = 'room added!'
      redirect_to room_path(@room)
    else
      render 'new'
    end
  end

  def show
    @room = Room.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  private

  def room_params
    params.require(:room).permit(:title, :category, :description)
  end
end
