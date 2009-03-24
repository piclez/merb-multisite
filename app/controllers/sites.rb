class Sites < Application

  before do
    throw :halt, Proc.new { raise NotFound } unless current_site
    self.class._template_roots << site_template_roots
  end
  
  after Proc.new {
    self.class._template_roots.pop
  }
  
  def _custom_template_location(context, type = nil, controller = controller_name)
    case controller
    when 'layout'
      'layout.html'
    else
      "#{controller}/#{context}.#{type}"
    end
  end
  
  private
  def site_template_roots
    [File.join(Merb.root, 'sites', current_site.path), :_template_location]
  end
end
