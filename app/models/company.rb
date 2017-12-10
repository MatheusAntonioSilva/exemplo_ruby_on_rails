require "bcrypt"
class Company < ActiveRecord::Base
	has_many :jobs
	#validades_presence_of :email, :name, :password
	#validades_uniqueness_of :email
	#validades_length_of :password, minimum: 6
	#validades_confirmation_of :password

	def password=(new_password)
		@password = new_password
		self.encrypted_password = BCrypt::Password.create(@password)
	end

	def password
		@password
	end

	def valid_password?(password_to_valid)
		BCrypt::Password.new(encrypted_password) == password_to_valid
	end
	
end
