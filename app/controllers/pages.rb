class Pages < Sites

  def index
    @pages = current_site.pages
    render
  end

end
