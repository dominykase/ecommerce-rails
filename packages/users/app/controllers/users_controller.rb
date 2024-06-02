# fronzen_string_literal: true

class ::Users::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    return unless passwords_match?

    User.create!(
      login: user_params[:login],
      password: user_params[:password],
    )
  end

  private

  def passwords_match?
    user_params[:password] == user_params[:password_confirmation]
  end

  def user_params
    @user_params ||= params.permit(:login, :password, :password_confirmation)
  end
end
