$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'activeadmin_delayed_job/version'

Gem::Specification.new do |s|
  s.name        = 'activeadmin-delayed-job'
  s.version     = ActiveAdminDelayedJob::VERSION
  s.authors     = ['Darren Rush']
  s.email       = ['']
  s.homepage    = 'https://github.com/drush/activeadmin-delayed-job'
  s.summary     = 'A plug-and-play controller that lets you monitor and retry jobs easily.'
  s.description = 'View all, running, failed, and queued jobs.  Retry failed jobs.'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.haml']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'activeadmin', '>= 1.4.0'
  s.add_dependency 'delayed_job_active_record', '>= 4.0.0'
end
