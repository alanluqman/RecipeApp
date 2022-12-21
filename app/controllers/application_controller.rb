class ApplicationController < ActionController::Base
    before_action :authenticate_user! 
    # protect_from_forgery with: :exception
    # before_action :update_allowed_parameters, if: :devise_controller? 
end
