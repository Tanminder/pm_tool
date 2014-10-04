class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :discussions, dependent: :destroy
  belongs_to :user

  validates :title, presence: true,
                  uniqueness: true
  validates :description, length: {minimum: 10} 

  before_save :capitalize_title

  def capitalize_title
    self.title.capitalize! 
  end

  
end
