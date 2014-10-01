class Discussion < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :comments, dependent: :destroy 

  validates :title, presence: true
  # validates :description, length: {minimum: 10} 

  before_save :capitalize_title

  def capitalize_title
    self.title.capitalize! 
  end
end
