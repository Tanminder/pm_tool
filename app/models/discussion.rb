class Discussion < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :comments, dependent: :destroy 

  validates :title, presence: true
  validates :description, length: {minimum: 10} 
end
