class Comment < ActiveRecord::Base
	belongs_to :job, counter_cache: true
	#attr_access :body, :job_id, :name
end
