module Merb
  module GlobalHelpers
    # helpers defined here available to all views.
    
    # Generates an image url for public/sites/{current_site.path}/flower.png
    def asset_url(name)
      "/sites/#{current_site.path}/#{name}"
    end
  end
end
