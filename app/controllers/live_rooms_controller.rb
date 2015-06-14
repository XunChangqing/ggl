class LiveRoomsController < ApplicationController
  before_action :set_live_room, only: [:show, :edit, :update, :destroy]

  # GET /live_rooms
  # GET /live_rooms.json
  def index
    @live_rooms = LiveRoom.all
  end

  # GET /live_rooms/1
  # GET /live_rooms/1.json
  def show
  end

  # GET /live_rooms/new
  def new
    @live_room = LiveRoom.new
  end

  # GET /live_rooms/1/edit
  def edit
  end

  # POST /live_rooms
  # POST /live_rooms.json
  def create
    @live_room = LiveRoom.new(live_room_params)

    respond_to do |format|
      if @live_room.save
        format.html { redirect_to @live_room, notice: 'Live room was successfully created.' }
        format.json { render :show, status: :created, location: @live_room }
      else
        format.html { render :new }
        format.json { render json: @live_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /live_rooms/1
  # PATCH/PUT /live_rooms/1.json
  def update
    respond_to do |format|
      if @live_room.update(live_room_params)
        format.html { redirect_to @live_room, notice: 'Live room was successfully updated.' }
        format.json { render :show, status: :ok, location: @live_room }
      else
        format.html { render :edit }
        format.json { render json: @live_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /live_rooms/1
  # DELETE /live_rooms/1.json
  def destroy
    @live_room.destroy
    respond_to do |format|
      format.html { redirect_to live_rooms_url, notice: 'Live room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_live_room
      @live_room = LiveRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def live_room_params
      params.require(:live_room).permit(:name, :provider, :url)
    end
end
