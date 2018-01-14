class ProjectDecorator <  BaseDecorator
  delegate :id, :name, :tasks, :created_at, :tasks_count
  
  def created_at
    object.created_at.strftime("%e %b %Y %H:%M")
  end

  def tasks_count
    object.tasks.length
  end

end
