class Task < ActiveRecord::Base
  belongs_to :project
  
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, allow_blank: true, length: { maximum: 2000 }
  
  mount_uploader :image, ImageUploader
end
