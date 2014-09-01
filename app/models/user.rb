# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
    has_secure_password

	before_save { |user| user.email = email.downcase }

	# Validation for the name attribute
    validates :name,  presence: true, length: { maximum: 50 }
    
    # Validation for the email attribute
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    # Validation for password attribute
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
end
