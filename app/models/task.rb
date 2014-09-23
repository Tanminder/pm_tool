class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :title, presence: true,
                  uniqueness: true
end