class ProjectDecorator <  BaseDecorator
  delegate :id, :text
  
  def created_at
    object.created_at.strftime("%e %b %Y %H:%M")
  end

end
