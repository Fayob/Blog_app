class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  include JsonWebToken

  before_action :authenticate_request

  respond_to :json
  

  # def encode_token(payload)
  #   JWT.encode(payload, 'secret')
  # end

  private

  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :encrypted_password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end
end
