class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  belongs_to :event

  def index
    @notifications = Notification.all
  end

  def create
    @event = Event.find(notification[:event_id])
    @notification = @event.notifications.build(notification_params)
  end

  def Show
    @notification = Notification.find(params[:id])
  end

  def update
    if @notification.update(notification_params)
      format.html { redirect_to @notifiction, notice: 'Notifiction was successfully updated.' }
      format.json { render :show, status: :ok, location: @notifiction }
    else
      format.html { render :edit }
      format.json { render json: @notifiction.errors, status: :unprocessable_entity }
    end
  end


  def destroy
    @notifiction.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notifiction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
  params.require(:notification).permit(:notification_time, :event_id)
  end
end
