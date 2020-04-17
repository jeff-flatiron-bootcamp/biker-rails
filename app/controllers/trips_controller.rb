class TripsController < ApplicationController
    before_action :redirect_user

    def index
        @trips = Trip.all
    end
    
    def new
        #code to check for user session[:id]
        #Time.zone = current_user.time_zone if logged_in?
        @trip = Trip.new
        @biker = Biker.find(session[:user_id])
        @bikes = @biker.bikes   
    end

    def show        
        @trip = Trip.find(params[:id])           
        @images = @trip.images  
    end

    def edit
        byebug
    end

    def create        
        @trip = Trip.new(trip_params)        
        if(@trip.save)
            redirect_to trip_path(@trip)
        else
            render :new
        end
    end

    def update
        @trip = Trip.find(params[:id])            
        @trip.update(trip_params)
        if(@trip)
            redirect_to @trip
        else
            render :show
        end
    end

    private

    def trip_params
        params.require(:trip).permit(
            :biker_id,
            :bike_id,
            :name,
            :start_city,
            :dest_city,
            :distance_miles,
            :start_date,
            :end_date,            
            images: [],
            trip_comments_attributes: [:comment, :biker_id]
        )
    end
end
