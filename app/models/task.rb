class Task < ApplicationRecord
    validates :text, presence: true
    validates :user_id, presence: true
    validates :project_id, presence: true
    
    belongs_to :project
    belongs_to :user
    has_many :comments, dependent: :destroy
end
