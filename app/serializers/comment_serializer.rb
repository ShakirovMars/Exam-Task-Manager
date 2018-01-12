class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id, :task_id
end
