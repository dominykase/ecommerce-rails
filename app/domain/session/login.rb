class Session::Login
  def initialize(login, password)
    @login = login
    @password = password
  end

  def handle
    user = User.find_by_login(@login)

    if user&.authenticate(@password)
      token = encode(user)

      return [{ token: token }, :ok]
    end

    [{ message: 'Invalid email or password' }, :unauthorized]
  end

  private

  def encode(user)
    JWT.encode(
      {
        user_id: user.id,
        exp: (Time.current + 1.day).to_i
      },
      ENV['JWT_SECRET']
    )
  end
end
