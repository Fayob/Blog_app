class Api::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    user = User.where(email: params[:email]).first

    if user.valid_password?(params[:password])
      token = jwt_encode({user_id: user.id})
      render json: {response: 'Login successfully', token: token}, status: :created
    else
      render json: {
        error: "Wrong email or password"
      }, status: 401
    end
  end
  
end