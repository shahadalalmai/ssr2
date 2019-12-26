class FavoritesController < ApplicationController
    before_action :authenticate_user!

    def index # get all favs of this user
        #@favs = Favorite.where(user_id: current_user)
        #@places = @favs.places
        #@places = Place.where(place_id: @favs.place_id)
        @places = Place.all

        @favs = Favorite.where(user_id: current_user, added: true)
        puts "HEYY I WROTE RUBY IN THE CONTROLLER"
        
        @favs.each do |f|
        
        puts "hey am looping"
        puts f.id
        puts f.user_id
        puts f.place_id
        puts f.added

                @places.each do |p|
                    if p.id == f.place_id
                    puts f.place.name    
                    end
                end

        end

        puts @favs
        puts "HEUU"

    end

    def new
        @place = Place.find(params[:id]) # the place the user wants to fav
        @user = current_user

        puts "THis is the place i clicked on"
        puts @place.name
        puts @place.id

        puts "this is the user signed in"
        puts @user.name
        puts @user.id

        @fav = Favorite.new 
        puts "Hey This is new method"

        @fav = Favorite.create(user_id: @user.id, place_id: @place.id, added: true)

        puts "Added fav"
        # @user = current_user
        # @place = Place.find(params[:place_id]) # specify the place
        # @fav = current_user.favorites.create(fav_params) # new record
        # @fav.place_id = @place.id
        # puts "Hey I created a fav"
        redirect_to my_fav_path(@user)
    end 
    
    def create 

    end

    

# private 
#   def fav_params
#     params.require(:favorite).permit(:added)
#   end
end
