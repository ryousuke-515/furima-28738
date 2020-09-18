class ApplicationController < ActionController::Base
   before_action :basic_auth
  #  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date])
  end

  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'ryousuke' && password == '1637'
    end
  end
end
