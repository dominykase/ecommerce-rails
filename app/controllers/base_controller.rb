class BaseController < ApplicationController
  def authorize_request
    header = request.headers['Authorization']
    bearer, token = header.split(' ')

    unless bearer == 'Bearer'
      return render json: { message: 'Invalid bearer token' }, status: :unauthorized
    end

    begin
      @decoded = JWT.decode(token, ENV['JWT_SECRET'])

      if @decoded.first['exp'] < Time.current.to_i
        return render json: { message: 'Expired token' }, status: :unauthorized
      end

      @user = User.find(@decoded.first['user_id'])
    rescue JWT::DecodeError
      render json: { message: 'Unauthenticated' }, status: :unauthorized
    end
  end
end
