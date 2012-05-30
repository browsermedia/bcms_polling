require 'browsercms'
module BcmsPolling
  class Engine < ::Rails::Engine
    isolate_namespace BcmsPolling
		include Cms::Module
		
		config.to_prepare do |app|
		  Cms::ViewContext.send(:include, BcmsPolling::MainAppPatch)
		  Cms::ViewContext.send(:include, BcmsPolling::PollsHelper)
		  
		  ::ApplicationHelper.send(:include, BcmsPolling::PollsHelper)
	  end
	  
	  initializer 'bcms_polling.route_extensions', :after => 'action_dispatch.prepare_dispatcher' do |app|
      ActionDispatch::Routing::Mapper.send :include, BcmsPolling::RouteExtensions
    end
  end
  
  # Patches Core CMS so views can access the main_app routes.
  module MainAppPatch
    
    def main_app
      Rails.application.routes.url_helpers
    end
    
  end
end
