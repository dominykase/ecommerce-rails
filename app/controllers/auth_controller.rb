class AuthController < ApplicationController
  protect_from_forgery with: :null_session

  def login
    user = User.find_by_login(params[:login])

    if user && user.authenticate(params[:password])
      token = JWT.encode(
        {
          user_id: user.id,
          exp: (Time.current + 1.day).to_i
        },
        ENV['JWT_SECRET']
      )

      return render json: { token: token }
    end

    return render json: { message: 'Invalid email or password' }, status: :unauthorized
  end
end
