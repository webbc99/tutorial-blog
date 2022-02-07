class AuthenticateUser
  # curl -H "Content-Type: application/json" -X POST -d '{"email":"webbc99@gmail.com","password":"Apples22"}' http://localhost:3000/authenticate
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end