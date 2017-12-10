module JobsHelper
  def job_title(job)
     def job_title(job) 
     	
     if job.company 
     	title = raw("#{h(job.title)} - #{h(job.company.name)}") 

     else title = raw("#{h(job.title)}") 
     end 

    if job.premium
      title + content_tag(:strong, " (premium)")
    else
      title
    end
  end
end
end