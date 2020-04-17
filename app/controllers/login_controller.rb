class LoginController < ApplicationController
    
    #similar to our new -> takes us to the login page
    def new
        @biker = Biker.new
    end

    #similar to create -> takes data from our login page and verifies the data
    def verify        

        @biker = Biker.find_by(user_name: params[:login][:user_name])
        if(nil==@biker)
            flash[:alert] = "User not found"              
            render :new
            return
        end
                
        if @biker.authenticate(params[:login][:password])
            session[:user_id] = @biker.id
            session[:first_name] = @biker.first_name
            session[:last_name] = @biker.last_name
            session[:biker_full_name] = @biker.biker_full_name            
            redirect_to biker_path(@biker)
        else
            flash[:alert] = "Invalid password"  
            session.clear
            #head(:forbidden)          
            render :new
        end

    end

    def logout        
        flash[:alert] = "Thanks for using Biker! See you later #{session[:first_name]}."        
        session.clear
        
        redirect_to login_path
    end

    
end