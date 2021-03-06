class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :event_params

  # GET /events
  # GET /events.json
  def index
    if current_user.admin?
      @events = Event.all.order("date_time ASC").page(params[:page]).per(15)
    elsif
      @events = current_user.events.order("date_time ASC").page(params[:page]).per(15)
    elsif
      @events.length == 0
      flash[:alert] = "You have no events to monitor. Create one now to get started."
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @user = current_user
    @event = Event.new
    render layout: false
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      if current_user.admin?
        @event = Event.find(params[:id])
      elsif
        @event = current_user.events.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :reminder_type, :date_time)
    end
end
