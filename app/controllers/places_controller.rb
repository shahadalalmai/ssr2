class PlacesController < ApplicationController
  

before_action :authenticate_user!, only: [:edit, :update, :destroy, :create, :new, :mine]

  def index
    @places = Place.all
    # I need this only to display the user name for each reveiw
    @users = User.all
    @user = current_user
  end

  def mine
    @places = current_user.places.all

  rescue ActiveRecord::RecordNotFound  
    redirect_to :controller => "places", :action => "index"
    return
  end

  def show
    @place = Place.find(params[:id])

  # when the user is trying to look for un authorized method
  rescue ActiveRecord::RecordNotFound  
    redirect_to :controller => "places", :action => "index"
    return

  end

  def new
    @place = current_user.places.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to places_path
  end

  def edit
    @place = current_user.places.find(params[:id])

      # when the user is trying to look for un authorized method
  rescue ActiveRecord::RecordNotFound  
    redirect_to :controller => "places", :action => "index"
    return

  end

  def update
    @place = current_user.places.find(params[:id])
    @place.update(place_params)
    redirect_to place_path(@place)

      # when the user is trying to look for un authorized method
  rescue ActiveRecord::RecordNotFound  
    redirect_to :controller => "places", :action => "index"
    return

  end

  def destroy
    current_user.places.find(params[:id]).destroy
    redirect_to places_path

      # when the user is trying to look for un authorized method
  rescue ActiveRecord::RecordNotFound  
    redirect_to :controller => "places", :action => "index"
    return

  end



  private 
  def place_params
    params.require(:place).permit(:user_id, :name, :desc, :city, :image, :location)
  end

end
