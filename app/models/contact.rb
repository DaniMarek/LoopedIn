class Contact < ActiveRecord::Base
	# has_many:subcontacts
  	belongs_to :user
end
