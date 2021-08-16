class Book < ApplicationRecord
 
  belongs_to :user
  validates :Title,presence: true
  validates :Opinion, presence: true
end
