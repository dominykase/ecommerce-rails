class SessionController < ApplicationController
  protect_from_forgery with: :null_session

  def login
    result, status = Session::Login.new(username, password).handle

    render json: result, status: status
  end

  private

  def username
    params.require(:login)
  end

  def password
    params.require(:password)
  end
end
