class BikersController < ApplicationController
        before_action :redirect_user, except: [:new, :create]
        before_action :get_biker, only: [:show, :edit, :update]

    def show     
        @trips = @biker.trips_newest_first        
    end

    def new
        @biker = Biker.new
    end

    def create
        
        @biker = Biker.new(biker_params)
        if(@biker.save)            
            session[:user_id] = @biker.id
            session[:first_name] = @biker.first_name
            session[:last_name] = @biker.last_name
            session[:biker_full_name] = @biker.biker_full_name                       
            redirect_to biker_path(@biker)
        else            
            puts @biker.errors
            render :new
        end
    end

    def edit        
    end

    def update
        if(@biker.update(biker_parmas))
            redirect_to @biker
        else
            render :edit
        end
    end
    
    private

    def biker_params
        params.require(:biker).permit(            
            :first_name,
            :last_name,
            :home_city,
            :user_name
        )
    end

    def get_biker        
        @biker = Biker.find(params[:id])        
    end

end
