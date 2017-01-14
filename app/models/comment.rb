class Comment < ActiveRecord::Base
	belongs_to :job
	#attr_access :body, :job_id, :name
end
