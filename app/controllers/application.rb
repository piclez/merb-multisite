class Application < Merb::Controller

  private
  def current_site
    @current_site ||= Site.first(:domain => request.domain)
  end
  
end