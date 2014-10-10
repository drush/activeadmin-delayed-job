ActiveAdmin.register Delayed::Job, :as => "Background Job" do
  menu label: "Background Jobs",  title: 'Background Jobs', parent: "Dashboard"

  actions :index, :show, :update, :edit, :destroy

  filter :queue

  # scope :all
  # scope :running
  # scope :failed
  # scope :waiting

  batch_action 'Retry' do |selection|
    Delayed::Job.find(selection).each do |job|
      job.retry!
    end
    redirect_to admin_background_jobs_path, :notice => "Retrying jobs"
  end


  index do     
    selectable_column                        
    column :id 
    column :queue
    column :priority
    
    column :status do |job|
      case job.state
      when 'failed'
        status_tag "Failed:", :error 
        span "#{job.last_error[0..100]}" 
      when 'running'
        status_tag "Running", :warning
        span "for #{time_ago_in_words(job.locked_at)} @ #{job.locked_by}"   
      when 'scheduled'
        status_tag "Scheduled", :ok
        span "for #{time_ago_in_words(job.run_at)} from now" 
      else
        status_tag "Queued" 
        span "for #{time_ago_in_words(job.created_at)}" 
      end
      
    end

    #column :run_at

    column :attempts

    #column :locked_at
    #column :locked_by
    #column :failed_at
    #column :last_error
    #column :created_at

    actions                   
  end 

end
