json.extract! task, :id, :text, :status, :user_id, :project_id, :created_at, :updated_at
json.url task_url(task, format: :json)
