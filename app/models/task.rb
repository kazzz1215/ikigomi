class Task < ActiveRecord::Base
  belongs_to :project
  
  validates :title, presence: true, length: { maximum: 140 }
end
