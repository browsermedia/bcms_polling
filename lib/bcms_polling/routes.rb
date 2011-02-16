module Cms::Routes
  def routes_for_bcms_polling
    namespace(:cms) do |cms|
      #cms.content_blocks :pollings
    end  
  end
end
