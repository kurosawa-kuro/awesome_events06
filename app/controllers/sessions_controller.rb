class SessionsController < ApplicationController
    skip_before_action :authenticate, only: :create
    
    def create
        user = User.find_or_create_from_auth_hash!(request.env["omniauth.auth"])  
        session[:user_id] = user.id
        flash[:notice] = "ログインしました"
        redirect_to root_path
    end

    def destroy
        reset_session
        redirect_to root_path, notice: "ログアウトしました"
    end 
end