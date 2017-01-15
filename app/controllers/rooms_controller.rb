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
      current_user.rooms << @room
      redirect_to room_path(@room)
    else
      render 'new'
    end
  end

  def show
    @room = Room.includes(:messages).find_by(id: params[:id])
    @message = Message.new

    founded = false
    @room.users.each do |u|
      if (current_user.id == u.id)
        founded = true
        break;
      end
    end

    if founded == false
      current_user.rooms << @room
    end
  end

  private

  def room_params
    params.require(:room).permit(:title, :category, :description)
  end
end
