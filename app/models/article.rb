class Article < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  belongs_to :user
  validates :body, presence: true, length: { minimum: 5 }
  
end
