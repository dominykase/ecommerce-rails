class AuthController < ApplicationController
  def login
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      token = JWT.encode(
        {
          user_id: user.id,
          exp: Time.current + 1.day
        },
        Rails.application.secrets.secret_key_base
      )

      render json: { token: token }
    end

    render json: { message: 'Invalid email or password' }, status: :unauthorized
  end
end
