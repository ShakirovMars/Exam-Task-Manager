class TaskDecorator <  BaseDecorator
  delegate :id, :text, :comments, :created_at, :comments_count
  
  def created_at
    object.created_at.strftime("%e %b %Y %H:%M")
  end

  def comments_count
    object.comments.length
  end

end
