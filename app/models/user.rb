require 'bcrypt'
require 'byebug'

class User
  attr_accessor :password_confirmation
  attr_reader :password

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true

  property :password_digest, String, length: 60


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password

end
