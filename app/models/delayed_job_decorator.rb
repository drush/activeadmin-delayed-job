Delayed::Job.class_eval do
  class << self
    def all
      scoped
    end

    def running
      where('failed_at is null and locked_at is not null')
    end

    def failed
      where('failed_at is not null')
    end

    def waiting
      where('failed_at is null and locked_at is null')
    end
  end

  def state
    return 'failed' unless failed_at.blank?
    return 'running' unless locked_at.nil?
    return 'scheduled' if run_at > created_at
    return 'queued'
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
