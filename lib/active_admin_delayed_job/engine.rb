module ActiveAdminDelayedJob
  class Engine < ::Rails::Engine
    isolate_namespace ActiveAdminDelayedJob

    initializer :active_admin_delayed_job do
      ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/active_admin_delayed_job/admin']
    end
  end
end
