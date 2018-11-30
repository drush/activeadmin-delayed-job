require 'activeadmin'

module ActiveAdminDelayedJob
  class Engine < ::Rails::Engine
    isolate_namespace ActiveAdminDelayedJob
    engine_name 'active_admin_delayed_job'

    initializer :active_admin_delayed_job do
      ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
