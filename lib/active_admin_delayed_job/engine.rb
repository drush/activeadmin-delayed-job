require 'activeadmin'

module ActiveAdminDelayedJob
  class Engine < ::Rails::Engine
    isolate_namespace ActiveAdminDelayedJob

    initializer :active_admin_delayed_job do
      if defined?(ActiveAdmin)
        ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
      end
    end
  end
end
