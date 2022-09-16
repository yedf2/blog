class TripsController < ApplicationController
  before_action :authenticate

  def index
    @trips = Trip.where(user_id: @user_id)
  end
  def new
  end
  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = @user_id
    n = Time.now.strftime("%Y-%m-%d")
    regex = /\d{4}-\d{2}-\d{2}/
    puts 'trip.date is'
    puts @trip.date
    if @trip.date !~ regex || @trip.date < n
      redirect_to '/trips/new', alert: 'bad date format should be like "2001-05-15"'
      return
    end

    @trip.save
    redirect_to '/trips'
  end

  private
    def trip_params
      params.require(:trip).permit(:name, :date)
    end
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      user = User.find_by_email(username)
      if user.password == password
        @user_id = user.id
      end
    end
  end
end
