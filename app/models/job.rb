class Job < ActiveRecord::Base
	has_many :comments
#attr_accessible :descripiton, :title, :premium
#protected_attributes :descripiton, :title, :premium 
#validates_presence_of  :title, :descripiton
end
