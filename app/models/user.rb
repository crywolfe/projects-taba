# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
	#call bcrypt gem method has_secure_password
	#without validations false, users cannot be created
	has_secure_password validations: false
	validates :password, presence: true


	#set relationships with other classes/tables
	has_many :posts

	#set criteria for name and email.
	validates(:name, { :presence => true })
  validates(:email, { :uniqueness => { case_sensitive: false }})


end
