class User < ActiveRecord::Base
	validates :email, :password_digest, :session_token, presence: true
	validates :password, length: {minimum: 6, allow_nil: true}
	validates :email, uniqueness: true

	after_initialize :set_session_token

	attr_reader :password

	def self.authenticate(user_params)
		user = User.find_by(email: user_params[:email])
		if BCrypt::Password.new(user.password_digest) == user_params[:password]
			user
		else
			nil
		end
	end

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def reset_session_token
		self.session_token = SecureRandom.urlsafe_base64(12)
		self.save
		self.session_token
	end

	private
	def set_session_token
		self.session_token = SecureRandom.urlsafe_base64(12)
	end
end
