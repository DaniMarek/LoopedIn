class User < ActiveRecord::Base
  has_secure_password

  has_many :contact_friending, foreign_key: :friend_id, class_name:"Contact"
  has_many :friending, through: :contact_friending, source: :friendee

  #all the users that are friends with me
  has_many :contact_friends, foreign_key: :friendee_id, class_name:"Contact"
  has_many :friends, through: :contact_friends, source: :friend

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  before_save :downcase
  # changes inputs to lowercase letters. this will help avoid errors and case sensitivity
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, format: { with:EMAIL_REGEX }
  private
  	def downcase
  		self.first_name.downcase!
  		self.last_name.downcase!
  		self.email.downcase!
  	end
end
