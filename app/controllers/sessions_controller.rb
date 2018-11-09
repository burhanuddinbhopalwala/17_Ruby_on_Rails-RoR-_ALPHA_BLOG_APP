class SessionsController < ApplicationController 

    # for /login request
    def new() 
    end 

    # for creating user, post login
    def create()
        user = User.find_by_email(params[:session][:email].downcase())
        if(user && user.authenticate(params[:session][:password]))
            session[:user_id] = user.id # in rails session backed by browser
            flash[:success] = "You have successfully logged in"
            redirect_to(user_path(user))
        else
            flash.now[:danger] = "Incorrect credentials" 
            # flash.now[], so that flash message do not clear on new request 
            render("new")
        end 
    end 

    # for /logout request  
    def destroy()
        session[:user_id] = nil
        flash[:success] = "You have logged out successfully"
        redirect_to(root_path())
    end
end 