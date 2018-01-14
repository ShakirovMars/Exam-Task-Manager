class TaskSerializer < ApplicationSerializer
  attributes :id, :text, :created_at, :comments_count

  has_many :comments
  
  class CommentSerializer < ApplicationSerializer
    attributes :id, :text, :user_id
  end

  def comments_count
    @instance_options[:comments_count]
  end
end