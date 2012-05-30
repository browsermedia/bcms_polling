module BcmsPolling::RouteExtensions
  def mount_bcms_polling
    
    # These routes are added to the main routes of the application, rather than under the engine
    #   In retrospect, its probably better to put them into the engine to reduce the chance of conflicts.
    get '/polls/:id/results', to:"bcms_polling/polling#results", as: 'poll_results' 
    get '/polls/:id/reset', to:"bcms_polling/polling#reset", as: 'poll_reset' 
    put '/poll_responses/:id', to:"bcms_polling/polling#update", as: 'poll_response' 
    
    mount BcmsPolling::Engine => "/bcms_polling"

  end
end
