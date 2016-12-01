class RoomsController < ApplicationController
  def index
    @rooms = Room.all#where(:type => params[:type])
  end

  def new
    @room = Room.new
    @room.type = params[:type]
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = 'room added!'
      redirect_to root_path
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
    params.require(:room).permit(:title)
  end
end
