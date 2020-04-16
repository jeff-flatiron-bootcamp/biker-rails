class ApplicationController < ActionController::Base
    #helper_method :redirect_user    

    def redirect_user        
        puts "REDIRECT_USER"
        if !session[:user_id]
            redirect_to login_path
        end
    end

    def logged_in?        
        !!session[:user_id]
    end

end
