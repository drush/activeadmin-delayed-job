$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_admin_delayed_job/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_admin_delayed_job"
  s.version     = ActiveAdminDelayedJob::VERSION
  s.authors     = ["Darren Rush"]
  s.email       = [""]
  s.homepage    = "http://github.com/drush/active_admin_delayed_job"
  s.summary     = "A plug-and-play controller that lets you monitor and retry jobs easily."
  s.description = "View all, running, failed, and queued jobs.  Retry failed jobs."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.0.0"
  s.add_dependency 'activeadmin', '~> 0.5.0'
  s.add_dependency 'delayed_job_active_record'
end
