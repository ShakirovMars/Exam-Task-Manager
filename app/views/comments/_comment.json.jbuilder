json.extract! comment, :id, :text, :user_id, :created_at, :updated_at, :task_id
json.url comment_url(comment, format: :json)
