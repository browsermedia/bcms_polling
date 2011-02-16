module Cms::Routes
  def routes_for_bcms_polling

    poll_results '/polls/:id/results', :controller=>"polling", :action=>'results'
    poll_reset '/polls/:id/reset', :controller=>"polling", :action=>'reset'
    poll_response '/poll_responses/:id', :controller=>"polling", :action=>'update'
    namespace(:cms) do |cms|
      cms.content_blocks :poll_responses
      cms.content_blocks :polls
    end
  end
end
