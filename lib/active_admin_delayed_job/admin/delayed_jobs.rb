ActiveAdmin.register Delayed::Job, :as => "Background Job" do
  menu label: "Background Jobs",  title: 'Background Jobs', parent: "Dashboard"

  actions :index, :show, :update, :edit, :destroy

  filter :queue

  batch_action 'Retry' do |selection|
    Delayed::Job.find(selection).each do |job|
      job.retry!
    end

    redirect_to self.send("#{ActiveAdmin.application.default_namespace}_background_jobs_path"), notice: "Retrying Jobs"
  end

  member_action :retry, method: :post do
    job = Delayed::Job.find(params[:id])
    job.retry!

    redirect_to self.send("#{ActiveAdmin.application.default_namespace}_background_jobs_path"), notice: "Retrying Job"
  end

  action_item :retry, only: :show do
    link_to("Retry Job", self.send("retry_#{ActiveAdmin.application.default_namespace}_background_job_path", resource), method: :post)
  end

  index do     
    selectable_column                        
    column :id 
    column :queue
    column :priority
    column :attempts
    
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

    actions defaults: true do |job|
      link_to("Retry Job", self.send("retry_#{ActiveAdmin.application.default_namespace}_background_job_path", job), method: :post)
    end              
  end

  show do |job|
    attributes_table *(default_attribute_table_rows - [:handler, :last_error]) do
      row(:handler) { simple_format(job.handler) rescue "" }
      row(:last_error) { simple_format(job.last_error) rescue "" }
    end
  end

end
