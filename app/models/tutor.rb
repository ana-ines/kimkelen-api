class Tutor < ActiveRecord::Base
	self.table_name = "tutor"

	belongs_to :person

end
