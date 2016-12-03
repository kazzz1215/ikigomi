class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }
end
