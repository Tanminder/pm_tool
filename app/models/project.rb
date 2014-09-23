class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :discussions, dependent: :destroy
  belongs_to :user

  validates :title, presence: true,
                  uniqueness: true
end
