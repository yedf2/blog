class TripsController < ApplicationController
  before_action :authenticate

  def index
    @trips = Trip.where({
      'user_id': @user.id,
      'multi_city': params['multi'] == "1" ? 1 : 0,
      })
  end
  def new
    @museums = Museum.all()
  end
  def create
    params.permit!
    pt = params['trip']
    if !pt || !pt['name'] || pt['name']=='' || !pt['date'] || pt['date']==''
      return report_error('you should specify the name and the date of the trip')
    end
    pm = params['museum']
    if !pm || pm.keys.size == 0
      return report_error("a trip should have at least one museum")
    end
    @trip = Trip.new(pt)
    @trip.user_id = @user.id
    n = Time.now.strftime("%Y-%m-%d")
    regex = /\d{4}-\d{2}-\d{2}/
    if @trip.date !~ regex || @trip.date <= n
      return report_error('bad date, should be a future date formated like "2001-05-15"')
    end

    ks = pm.keys
    cities = Museum.where(id: ks).select('city').uniq
    @trip.multi_city = cities.size >= 2 ? 1 : 0

    @trip.save
    ks.each do |m|
      tm = TripMuseum.new({'trip_id':@trip.id, 'museum_id': m})
      tm.save
    end
    redirect_to '/trips'
  end
  def show
    @trip = Trip.find(params[:id])
    ms = TripMuseum.where({'trip_id': params['id']}).select('museum_id')
    @museums = Museum.where({'id': ms})
  end

  def museums
    mids = Hash.new
    TripMuseum.where({'trip_id': params['id']}).each do |k|
      mids[k.museum_id] = 1
    end
    @trip = Trip.find(params[:id])
    @museums = Array.new
    Museum.all.each do |museum|
      @museums << {
        "name": museum.name,
        "city": museum.city,
        "state": museum.state,
        "description": museum.description,
        "id": museum.id,
        "selected": mids[museum.id]==1,
      }
    end
  end
  def trip_museum_delete
    TripMuseum.where({'trip_id': params['tid'], 'museum_id': params['mid']}).destroy_all
    redirect_to '/trips/'+params['tid']
  end
  def trip_museum_toggle
    if params['op'] == 'del'
      TripMuseum.where({'trip_id': params['tid'], 'museum_id': params['mid']}).destroy_all
      update_multi(params['tid'])
    else
      TripMuseum.new({'trip_id': params['tid'], 'museum_id': params['mid']}).save
      update_multi(params['tid'])
    end
    redirect_to '/trips/museums?id='+params['tid']
  end
  def trip_delete
    TripMuseum.where({'trip_id': params['id']}).destroy_all
    Trip.find_by_id(params['id']).destroy
    redirect_to trips_path
  end

  private
  def report_error(msg)
    redirect_to '/trips/new', alert: msg
  end
  def update_multi(tid)
    ids = TripMuseum.where({'trip_id': tid}).select('museum_id')
    cities = Museum.where(id: ids).select('city').uniq
    trip = Trip.find_by_id(tid)
    trip.multi_city = cities.size >= 2 ? 1 : 0
    trip.save
  end
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      user = User.find_by_email(username)
      if user && user.password == password
        @user = user
      end
    end
  end
end
