class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_event
  around_filter :with_timezone


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  def load_event
    @event = Event.new
  end

  private

  def with_timezone
    timezone = Time.find_zone(cookies[:timezone])
    Time.use_zone(timezone) { yield }
    update_timezone
  end

  def update_timezone
    if current_user
      time_zone = current_user.update(:time_zone => cookies[:timezone])
    end
  end

end
