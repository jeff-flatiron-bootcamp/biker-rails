class BikesController < ApplicationController
    before_action :redirect_user

    def new 
        @bike = Bike.new
    end

    def create
        @bike = Bike.new(bike_params)
        if(@bike.save)
            redirect_to bike_path(@bike)
        else
            render :new
        end
    end

    def edit                
        @bike = Bike.find(params[:id])        
    end

    def update        
        @bike = Bike.find(params[:id])
        
        @bike.update(bike_params)
        if(@bike)            
            redirect_to bike_path(@bike)
        else
            render :edit
        end
    end

    def show
        @bike = Bike.find(params[:id])
    end

    def images        
        @bike = Bike.find(params[:bike_id])
        @image = @bike.images.find(params[:image_id])                
    end

    def destroyImage
        @bike = Bike.find(params[:bike_id])
        @bike.images.find(params[:image_id]).destroy

        redirect_to edit_bike_path(@bike)
        
    end

    private

    def bike_params
        params.require(:bike).permit(
            :bike_name,
            :bike_type,
            :manufacturer_id,
            :biker_id,
            :stolen,
            images: []
        )
    end
end
