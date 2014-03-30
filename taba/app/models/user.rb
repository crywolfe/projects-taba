class User < ActiveRecord::Base
	#call bcrypt gem method has_secure_password
	has_secure_password validations: false
	validates :password, presence: true


	#set relationships with other classes/tables
	has_many :posts

	#set criteria for name and email.
	validates(:name, { :presence => true })
  validates(:email, { :uniqueness => { case_sensitive: false }})


end