# fronzen_string_literal: true

class UsersController < BaseController
  protect_from_forgery with: :null_session

  before_action :authorize_request, only: %i(show)

  def create
    return unless passwords_match?

    User.create!(
      login: user_params[:login],
      password: user_params[:password]
    )
  end

  def show
    user = User.find(params[:id])

    return render json: { message: 'Unauthorized' }, status: :unauthorized unless user.id == @user.id

    return render json: user, status: :ok
  end

  private

  def passwords_match?
    user_params[:password] == user_params[:password_confirmation]
  end

  def user_params
    @user_params ||= params.permit(:login, :password, :password_confirmation)
  end
end
