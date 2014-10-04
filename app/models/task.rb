class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :title, presence: true
                  # uniqueness: true
  before_save :capitalize_title

  def capitalize_title
    self.title.capitalize! 
  end
end
