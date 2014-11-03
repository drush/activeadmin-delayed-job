$:.push File.expand_path("../lib", __FILE__)

require "active_admin_delayed_job/version"

Gem::Specification.new do |s|
  s.name        = "active_admin_delayed_job"
  s.version     = ActiveAdminDelayedJob::VERSION
  s.authors     = ["Darren Rush"]
  s.email       = [""]
  s.homepage    = "http://github.com/drush/active_admin_delayed_job"
  s.summary     = "A plug-and-play controller that lets you monitor and retry jobs easily."
  s.description = "View all, running, failed, and queued jobs.  Retry failed jobs."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.haml"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'activeadmin'
  s.add_dependency 'delayed_job_active_record'
end
