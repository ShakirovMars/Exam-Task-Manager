class TaskSerializer < ActiveModel::Serializer
  attributes :id, :text, :status, :user_id, :progect_id
end
