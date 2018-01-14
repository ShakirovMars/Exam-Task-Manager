class ProjectSerializer < ApplicationSerializer
  attributes :id, :name, :created_at, :tasks_count

  has_many :tasks
  
  class TaskSerializer < ApplicationSerializer
    attributes :id, :text, :status, :user_id
  end

  def tasks_count
    @instance_options[:tasks_count]
  end
end