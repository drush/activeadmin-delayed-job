Delayed::Job.class_eval do
  def state
    return 'failed' unless failed_at.blank?
    return 'running' unless locked_at.nil?
    return 'scheduled' if run_at > created_at

    'queued'
  end

  def retry!
    j = self
    j.run_at = Time.now
    j.last_error = nil
    j.failed_at = nil
    j.attempts = 0
    j.save
  end
end
